// See: https://pdfbox.apache.org/

// https://mvnrepository.com/artifact/org.apache.pdfbox/pdfbox-tools
@Grapes(
    @Grab(group='org.apache.pdfbox', module='pdfbox-tools', version='2.0.24')
)


import org.apache.pdfbox.tools.ExtractText

String year='2021'

File amazon_folder = new File('../data/Amazon-Card')
assert amazon_folder.exists()


File year_folder = new File(amazon_folder, year)
assert year_folder.exists()

File output_folder = new File('../temp/text-OUT')
output_folder.mkdir()
assert output_folder.exists()

Closure process_pdf = {
    File pdf_file
    ->
    
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

year_folder.eachFile {
   File pdf_file
   ->
   if (!pdf_file.name.endsWith('.pdf')) {
      return
   }
   String fname = pdf_file.name - '-.pdf'
   File output_file = new File(output_folder, "${fname}.OUT")

   println "Processing $year/$fname ..."
   output_file.text = process_pdf( pdf_file )
   
} //end eacheFile




