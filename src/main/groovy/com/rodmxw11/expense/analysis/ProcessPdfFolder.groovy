package com.rodmxw11.expense.analysis

import org.apache.pdfbox.tools.ExtractText
import java.util.regex.Pattern
import java.util.regex.Matcher
import groovy.transform.CompileStatic

@CompileStatic
class ProcessPdfFolder {
    // 10/23  PANDORA*INTERNET RADIO PDORA.COM/BIL CA 58.87
    static final String LINE_ITEM_PATTERN_REGEX = '''(?mx)
       ^(\\d+\\/\\d+) # line starts with dd/dd
       \\s+  # followed by required space
       (.+?)\\s+ # all chars up to spaces before ...
       ([\\$\\+\\-,\\d]*\\.\\d\\d)$ # line ends with numeric data ...  [$+-\\d]*.dd
       \\r?\\n # examine next line ...
       (^(?!\\d+\\/\\d+).*?$)?  # optional next line that does not begin with mm/dd pattern
       '''
    static final Pattern line_item_pattern =   Pattern.compile(LINE_ITEM_PATTERN_REGEX)

    // ----------------------- capture other info:
//Previous Balance $5,016.87
//Payment, Credits -$9,216.87
//Purchases +$5,813.84
//Cash Advances $0.00
//Balance Transfers $0.00
//Fees Charged $0.00
//Interest Charged $0.00
//Opening/Closing Date 10/05/21 - 11/04/21
//New Balance $1,613.84

    static final String summary_headers = 'filename,open_date,close_date,new_bal,bonus_points,prev_bal,payments,purchases,cash_advance,fees,interest\n'
    static final String summary_row = '%s,%s,%s'+(',"%s"'*8)+'\n'
    static final Pattern open_close_dates = ~/Opening\/Closing Date\s+([\d\/]+)\s+-\s+([\d\/]+)/

    static final String tags_xlate_sed_path = 'scripts/tag-xlate.sed'
    static final ClassifyCsvRow tags_xlate_matcher = new ClassifyCsvRow(new File(tags_xlate_sed_path))

    static String fmt_date(String year, String date) {
        assert date ==~ /\d\d[-\/]\d\d/
        return year+ '-' + date.replace('/','-')
    }

    static String fmt_dollars(String text) {
        return text?text.replaceAll(',','').replaceAll(/\$/,'').replaceAll(/\+/,''):''
    }

    static String fmt_text(String text) {
        // & MCDONALD'S F15546
        if (text==null) {
            return ''
        }

        text = text.trim()

        if (text.startsWith('&')) {
            text = text.substring(1).trim()
        }

        if (text.startsWith('SQ *')) {
            text = text.substring(4).trim()
        }

        if (text.startsWith('PAYPAL *')) {
            text = text.substring(8).trim()
        }

        return text.replaceAll(/\s+/,' ').replaceAll('"',"'")
    }

    static List<List<String>> parse_line_items(String file_text) {
        List<List<String>> lines = new ArrayList()
        file_text.eachMatch(line_item_pattern) {
            String full_match, String date, String description, String amount, String xtra
                ->
                if (xtra==null || xtra =~ /(?i)^(Total|PAYMENTS)/) {
                    xtra = ''
                }

                lines << [date,description,amount,xtra]
        }
        return lines
    }

    static final String CSV_ROW_FORMAT = '"%s","%s","%s","%s","%s","%s"'
    static String format_csv_row(List<String> items, String year) {
        def (
           String date,
           String description,
           String amount,
           String xtra
        ) = [items[0], items[1], items[2], items[3]]

        String formatted_description = fmt_text(description)
        def strings = tags_xlate_matcher.lookupTags(formatted_description)
        def (
           String tag1,
           String tag2
        ) = [strings[0], strings[1]]

        String csv_row = String.format(
                CSV_ROW_FORMAT,
                fmt_date(year, date),
                formatted_description,
                fmt_dollars(amount),
                fmt_text(xtra),
                tag1,
                tag2
        )
        return csv_row
    }


    static String process_line_items(String file_name, String file_text, String year) {
        StringBuilder buf = new StringBuilder()
        List<List<String>> lines = parse_line_items(file_text)
        lines.eachWithIndex {
            List<String> items, int line_nbr
            ->
                buf << String.format(
                        '"%s",%d,%s\n',
                        file_name,
                        line_nbr+1,
                        format_csv_row(items, year)
                )
        }

        return buf.toString()
    }

    static String process_summary_info(String file_name, String file_text) {
        Closure<String> find_amount = { String label -> fmt_dollars(file_text.find(
                "(?<=${label}\\s)"+/[\$\+\-,\d]*\.\d\d/
        )) }

        String open_date
        String close_date
        file_text.find( open_close_dates ) {
            String match, String open, String close
                ->
                open_date = open.substring(0,6)+'20'+open.substring(6)
                close_date = close.substring(0,6)+'20'+close.substring(6)
        } //endfind

        String points = fmt_dollars(file_text.find( "(?i)(?<=redemption\\s)"+/[\$\+\-,\d]+/ ))

        String summary_line = String.format(
                summary_row,
                file_name,
                open_date,
                close_date,
                find_amount('New Balance'),
                points,   // bonus_points,
                find_amount('Previous Balance'),
                find_amount('Payment, Credits'),
                find_amount('Purchases'),
                find_amount('Cash Advances'),
                find_amount('Fees Charged'),
                find_amount('Interest Charged')
        )

        return summary_line
    }

    static String process_pdf(File pdf_file)  {
        // See: https://coderedirect.com/questions/222661/redirect-process-output-to-stdout

        // IMPORTANT: Save the old System.out!
        PrintStream old = System.out

        // Create a stream to hold the output
        ByteArrayOutputStream baos = new ByteArrayOutputStream()
        PrintStream ps = new PrintStream(baos)

        try {
            // Tell Java to use your special stream
            System.out = ps

            ExtractText.main(
                    [
                            '-console',
                            pdf_file.absolutePath
                    ] as String[]
            )

            System.out.flush()
        } finally {
            System.out = old
            ps.close()
        }

        return baos.toString()
    }

    static void process_year_folder(
            File year_folder,
            String year,
            File output_folder,
            File summary_file
    ) {
        year_folder.eachFile {
            File pdf_file
                ->
                // only want to process .pdf files in this folder
                if (!pdf_file.name.endsWith('.pdf')) {
                    return
                }
                String file_name = pdf_file.name - '-.pdf'

                println "Processing $year/${file_name}..."

                // read in string extracts from PDF file
                String file_text  = process_pdf( pdf_file )
                // DEBUG println "......................\n\n$file_text\n\n"

                File output_file = new File(output_folder, "${file_name}.csv")
                output_file.text = process_line_items(file_name, file_text, year)

                summary_file.append( process_summary_info ( file_name, file_text ))
        } //end eacheFile
    }

    static Map<String,String> getProperties() {
        String props_file = 'src/main/resources/application.properties'
        Properties props = new Properties()
        props.load(new File(props_file).newInputStream())
        return props as Map<String,String>
    }

    static void processOneYear(File pdfFolder, String year, File csvFolder) {
        assert pdfFolder.exists() && pdfFolder.directory,"ERROR: PDF folder does not exist: ${pdfFolder.absolutePath}"
        File year_folder = new File(pdfFolder, year)
        assert year_folder.exists() && year_folder.directory, "ERROR: year folder does not exist: ${year_folder.absolutePath}"

        if (csvFolder.exists()) {
            assert csvFolder.directory
        } else {
            csvFolder.mkdir()
        }
        assert csvFolder.exists() && csvFolder.directory

        File summary_file = new File(csvFolder, "${year}-summary.csv")
        summary_file.text = summary_headers

        process_year_folder(
                year_folder,
                year,
                csvFolder,
                summary_file
        )
    }

    static void main(String[] args) {
//        assert args.length>0, "Usage: groovy process-pdf-folder.groovy <year>"
//        String year = args[0]
//        assert year!=null, "year cannot be null"

        Map<String, String> props = getProperties()
        println props
        //System.exit(0)
        File pdfFolder = new File(props['amazon.pdf.year.folder'])
        File csvFolder = new File(props['amazon.csv.year.folder'])
        String[] years = props['amazon.years'].split(',')
        years.each {
            year ->
            processOneYear(pdfFolder, year, csvFolder)
        }
    }
} //endclass