package com.rodmxw11.expense.analysis

import org.apache.pdfbox.tools.ExtractText
import java.util.regex.Pattern
import java.util.regex.Matcher
import groovy.transform.CompileStatic

@CompileStatic
class ProcessPdfFolder {
    // 10/23  PANDORA*INTERNET RADIO PDORA.COM/BIL CA 58.87
    static final Pattern line_item_pattern =   ~/(?m)^(\d+\/\d+)\s+(.+?)\s+([\$\+\-,\d]*\.\d\d)$\n(^(?!\d+\/\d+).*?$)?/

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


    static String fmt_dollars(String text) {
        return text?text.replaceAll(',','').replaceAll(/\$/,'').replaceAll(/\+/,''):''
    }

    static String fmt_text(String text) {
        return text?text.replaceAll(/\s+/,' ').replaceAll('"',"'"):''
    }

    static final String CSV_ROW_FORMAT = '%s,%d,%s/%s,"%s","%s","%s"\n'
    static String process_line_items(String file_name, String file_text, String year) {
        StringBuilder buf = new StringBuilder()
        int line_nbr=1
        file_text.eachMatch(line_item_pattern) {
            String full_match, String date, String description, String amount, String xtra
                ->
                if (xtra =~ /(?i)^(Total|PAYMENTS)/) {
                    xtra = ''
                }
                String csv_row = String.format(
                        CSV_ROW_FORMAT,
                        file_name,
                        line_nbr++,
                        date,
                        year,
                        fmt_text(description),
                        fmt_dollars(amount),
                        fmt_text(xtra)
                )
                buf << csv_row
        } //endeachMatch
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

        // Tell Java to use your special stream
        System.out = ps

        ExtractText.main(
                [
                        '-console',
                        pdf_file.absolutePath
                ] as String[]
        )

        System.out.flush()
        System.out = old
        ps.close()

        return baos.toString()
    }

    static void process_year_folder(File year_folder, String year, File output_folder, File summary_file) {
        year_folder.eachFile {
            File pdf_file
                ->
                if (!pdf_file.name.endsWith('.pdf')) {
                    return
                }
                String file_name = pdf_file.name - '-.pdf'

                println "Processing $year/${file_name}..."
                String file_text  = process_pdf( pdf_file )

                File output_file = new File(output_folder, "${file_name}.csv")
                output_file.text = process_line_items(file_name, file_text, year)

                summary_file.append( process_summary_info ( file_name, file_text ))
        } //end eacheFile
    }

    static void main(String[] args) {
        assert args.length>0, "Usage: groovy process-pdf-folder.groovy <year>"
        String year = args[0]
        assert year!=null, "year cannot be null"

        File amazon_folder = new File('./data/Amazon-Card')
        assert amazon_folder.exists()

        File year_folder = new File(amazon_folder, year)
        assert year_folder.exists(),"ERROR: year folder does not exist: ${year_folder.absolutePath}"

        File output_folder = new File('./temp/text-OUT')
        output_folder.mkdir()
        assert output_folder.exists()

        File summary_file = new File(output_folder, "${year}-summary.csv")
        summary_file.text = summary_headers

        process_year_folder(
                year_folder,
                year,
                output_folder,
                summary_file
        )
    }
} //endclass















