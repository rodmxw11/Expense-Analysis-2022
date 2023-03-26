package com.rodmxw11.expense.analysis

import spock.lang.*
import static com.rodmxw11.expense.analysis.ProcessPdfFolder.*

class TestProcessPdfFolder extends Specification {
    def "line_item_pattern regex simple matches"() {
        def line = '10/23  PANDORA*INTERNET RADIO PDORA.COM/BIL CA 58.87'
        expect:
        // does not begin with date
        !('' ==~ line_item_pattern)
        // does not end in \n
        !(line ==~ line_item_pattern)
        !(line+'\r' ==~ line_item_pattern)
        // no \n found
        !(line+line ==~ line_item_pattern)
        // !(line+line+'\n' ==~ line_item_pattern) // OK? starts with date and ends with amount
        line+'\n' ==~ line_item_pattern
        // xtra line cannot start with a date
        !(line+'\n'+line ==~ line_item_pattern)
        line+'\n'+'extra information on next line' ==~ line_item_pattern
        line+'\r\n' ==~ line_item_pattern
        // xtra line cannot start with date
        !(line+'\r\n'+line ==~ line_item_pattern)
        line+'\r\n'+'extra information on next line'  ==~ line_item_pattern
    }

    def "test parse_line_items()"() {
        def line1 = '10/23  PANDORA*INTERNET RADIO PDORA.COM/BIL CA 58.87\n'
        def line2 = '01/09  Carquest @ Glenwood South  $2,333.45\n'
        expect:
        [] == parse_line_items('')
        [['10/23','PANDORA*INTERNET RADIO PDORA.COM/BIL CA','58.87','']]==parse_line_items(line1)
        [['10/23','PANDORA*INTERNET RADIO PDORA.COM/BIL CA','58.87','this is extra info']]==parse_line_items(line1+'this is extra info')
        [['01/09','Carquest @ Glenwood South','$2,333.45','']]==parse_line_items(line2)
        [['01/09','Carquest @ Glenwood South','$2,333.45','how about that!']]==parse_line_items(line2+'how about that!')
        [['10/23','PANDORA*INTERNET RADIO PDORA.COM/BIL CA','58.87',''],['01/09','Carquest @ Glenwood South','$2,333.45','']]==parse_line_items(line1+line2)
        [
                ['10/23','PANDORA*INTERNET RADIO PDORA.COM/BIL CA','58.87','this is extra info'],
                ['01/09','Carquest @ Glenwood South','$2,333.45','how about that!']
        ]==parse_line_items(line1+'this is extra info\n'+line2+'how about that!')
        [
                ['10/23','PANDORA*INTERNET RADIO PDORA.COM/BIL CA','58.87','this is extra info'],
                ['01/09','Carquest @ Glenwood South','$2,333.45','how about that!']
        ]==parse_line_items(line1+'this is extra info\na\n\n\nb\nc\n'+line2+'how about that!\nx\nyy\nzzz\n\n')
    }

    def "test fmt_dollars()"() {
        expect:
        fmt == fmt_dollars(raw)

        where:
        raw || fmt
        null || ''
        '' || ''
        '22.99' || '22.99'
        '$22.99' || '22.99'
        '+22.99' || '22.99'
        '+$22.99' || '22.99'
        '-22.99' || '-22.99'
        '-$22.99' || '-22.99'
        '$-22.99' || '-22.99'
        '.01' || '.01'
        '$.01' || '.01'
        '+.01' || '.01'
        '-.01' || '-.01'
        '-$.01' || '-.01'
        '1,234.56' || '1234.56'
        '$1,234.56' || '1234.56'
        '+$1,234.56' || '1234.56'
        '-$1,234.56' || '-1234.56'
        '1,234,567,890.75' || '1234567890.75'
        '$1,234,567,890.75' || '1234567890.75'
        '-1,234,567,890.75' || '-1234567890.75'
        '-$1,234,567,890.75' || '-1234567890.75'
    }

    def "test fmt_text()"() {
        expect:
        fmt == fmt_text(raw)

        where:
        raw || fmt
        null || ''
        '' || ''
        '&' || ''
        '   &' || ''
        '                   ' || '' // trimmed
        'Hello World!' || 'Hello World!'
        '& Hello World!' || 'Hello World!'
        '         Hello          Good        World!      ' || 'Hello Good World!' // single spaces
        '      &   Hello          Good        World!      ' || 'Hello Good World!' // single spaces
        '"Hello World!"' || "'Hello World!'" // double quotes repl with quotes
        '& "Hello World!"' || "'Hello World!'" // double quotes repl with quotes
        '              "Hello             World!"           ' || "'Hello World!'"
        '          &    "Hello             World!"           ' || "'Hello World!'"
    }

    def "test fmt_date()"() {
        def year = '2023'
        expect:
        fmt == fmt_date(year,date)

        where:
        date || fmt
        '10/23' || '2023-10-23'
        '10-23' || '2023-10-23'
    }
}
