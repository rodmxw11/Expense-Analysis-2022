package com.rodmxw11.expense.analysis

// See: https://github.com/xlson/groovycsv
// See: http://xlson.com/groovycsv/docs/1.3/javadoc/
import static com.xlson.groovycsv.CsvParser.parseCsv
import groovy.sql.Sql

import groovy.transform.CompileStatic

@CompileStatic
class ProcessCsvFile {
    // 20211204-statements-4220,17,11/06/2021,"Prime Video*KG7WD3FO3 888-802-3080 WA","10.71","Order Number D01-2491978-4585851"
    static final List<String> COLUMN_NAMES = ['fname','lineno','date','detail','amount','extra']
    static void main(String[] args) {

        String csv_path = 'temp/text-OUT/20211204-statements-4220.csv'
        File csv_file = new File(csv_path)
        Iterator csv_rows = parseCsv(
                csv_file.newReader(),
                columnNames: COLUMN_NAMES,
                readFirstLine: true
        )
//        csv_rows.each {
//            println it
//        }

        Sql db = Sql.newInstance(
                'jdbc:h2:./workspace/finance-2022-db', // db.url,
                'sa',  //db.user,
                'sa', //db.password,
                'org.h2.Driver' //db.driver
        )
        assert db!=null
    }
}
