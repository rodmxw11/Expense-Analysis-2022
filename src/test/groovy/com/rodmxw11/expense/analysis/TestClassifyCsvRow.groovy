package com.rodmxw11.expense.analysis

import spock.lang.*
import  com.rodmxw11.expense.analysis.ClassifyCsvRow
import static com.rodmxw11.expense.analysis.ClassifyCsvRow.UNKNOWN_TAGS

class TestClassifyCsvRow extends Specification {
        static List<String> lotsa_sed_lines = '''
# medical = dentist, doctor, pharmacy
# school = ECU, NC STATE, UNC
# fee = dmv, tags
# tax = property tax
# home = home maintenance
# donation = giving money away
# autos = automobile

# misc = non categorized



s/"& /"/g
s/://g
s/"4464 Dominos Pizza.*"/"dominos pizza:food"/g
s/"AAA .*"/"aaa:membership"/g
s/"ALDI .*"/"aldi:shop"/g
s/"Amazon.com.*"/"amazon.com:delivery"/g
s/"Amazon Music.*"/"amazon music:service"/g
s/"Amazon ?Prime.*"/"amazon.com:delivery"/g
s/"Amazon Digital.*"/"amazon digital:service"/g
s/"(BRUEGGERS|SQ \\*BRUEGGER'S BAGELS).*"/"breuggers bagels:food"/g
s/"AMZN Digital.*"/"amazon digital:service"/g
s/"Amazon Kindle.*"/"amazon kindle:service"/g
s/"Amazon Services-Kindle.*"/"amazon kindle:service"/g
s/"AMAZON MKTPLACE PMTS.*"/"amazon payment:payment"/g
s/"(Amazon Video|Prime Video).*"/"amazon video:service"/g
s/"AMERICAN AI.*"/"american airlines:travel"/g
s/"AMZN Mktp.*"/"amazon.com:delivery"/g
s/"AMZN Pickup.*"/"amazon.com:delivery"/g
s/"(APL\\*|APPLE\\.COM).*"/"apple online:service"/g
s/"(ATT|AT&T).*"/"at&t:utility"/g
s/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g
s/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g
s/"HIBACHI.*"/"hibachi grill:food"/g
s/"HOT TOPIC.*"/"hot topic myrtle beach:travel"/g
s/"Amazon ?Prime.*"/"amazon.com:delivery"/g
s/"(Amazon Video|Prime Video).*"/"amazon video:service"/g
s/"(BRUEGGERS|SQ \\*BRUEGGER'S BAGELS).*"/"breuggers bagels:food"/g
s/"(APL\\*|APPLE\\.COM).*"/"apple online:service"/g
s/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \\*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g
s/"CNTY\\/YLLW CAB.*"/"stl yellow cab:travel"/g
'''.split('\n') as List

    static ClassifyCsvRow lotsa_seds_classifier
    static final String tag_xlate_sed_path = 'scripts/tag-xlate.sed'
    static ClassifyCsvRow tag_xlate_classifier
    def setupSpec() {
        lotsa_seds_classifier = new ClassifyCsvRow(lotsa_sed_lines)
        File tag_xlate_file = new File(tag_xlate_sed_path)
        assert tag_xlate_file.exists()
        tag_xlate_classifier = new ClassifyCsvRow(tag_xlate_file)
    }

    def "test ClassifyCsvRow CTOR one sed row"() {
        def test_sed = ['s/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g']

        given:
        def csv_classifier = new ClassifyCsvRow(test_sed)

        expect:
        csv_classifier!=null
        csv_classifier.regexCount == 1
        csv_classifier.lookupTags('mary had a little lamb') == UNKNOWN_TAGS
        csv_classifier.lookupTags('helicopter solutions NA, LTD') == ['helicopter solutions','travel']
    }

    def "test ClassifyCsvRow CTOR skips comments"() {
        def test_sed = [
                '# comment 1',\
                '                                ', // blank line
                '', // empty line
                's/"& /"/g', // special sed skipped
                's/://g', // special sed skipped
                's/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g',
                '         # lasdfkasldkfasldkfaslfj'
        ]

        given:
        def csv_classifier = new ClassifyCsvRow(test_sed)

        expect:
        csv_classifier!=null
        csv_classifier.regexCount == 1
        csv_classifier.lookupTags('mary had a little lamb') == UNKNOWN_TAGS
        csv_classifier.lookupTags('helicopter solutions NA, LTD') == ['helicopter solutions','travel']
    }


    def "test ClassifyCsvRow CTOR with lots of sed expressions"() {
        expect:
        expected_tags == lotsa_seds_classifier.lookupTags(description)

        where:
        expected_tags | description
        UNKNOWN_TAGS | 'mary had a little lamb'
        ['helicopter solutions','travel'] | 'helicopter solutions NA, LTD'
        ['hibachi grill','food'] | 'hibachi-seasoning in RTP'
        ['hot topic myrtle beach', 'travel'] | 'hot topical paradise'
        ['amazon.com','delivery'] | 'amazonprime books'
        ['amazon.com','delivery'] | 'amazon prime books'
        ['amazon video','service'] | 'amazon video service'
        ['amazon video','service'] | 'prime video service'
        ['breuggers bagels', 'food'] | 'BRUEGGERS bagels'
        ['breuggers bagels', 'food'] | "sq *BRUEGGER'S bagels"
        ['apple online','service'] | 'APL*ITUNES online'
        ['apple online','service'] | 'apple.com online'
        ['consumer reports','service'] | 'consumerreports yearly subscription'
        ['consumer reports','service'] | 'CONSUMERRPRTS yearly subscription'
        ['consumer reports','service'] | 'cr *consumer yearly subscription'
        ['consumer reports','service'] | 'cr digital media yearly subscription'
        ['stl yellow cab','travel'] | 'cnty/yllw cab ladue to creve coeur'
    }

    def "test ClassifyCsvRow init using tag-xlate.sed file"() {
        expect:
        expected_tags == tag_xlate_classifier.lookupTags(description)

        where:
        expected_tags | description
//        UNKNOWN_TAGS | 'mary had a little lamb'
//        ['helicopter solutions','travel'] | 'helicopter solutions NA, LTD'
//        ['hibachi grill','food'] | 'hibachi-seasoning in RTP'
//        ['hot topic myrtle beach', 'travel'] | 'hot topical paradise'
//        ['amazon.com','delivery'] | 'amazonprime books'
//        ['amazon.com','delivery'] | 'amazon prime books'
//        ['amazon video','service'] | 'amazon video service'
//        ['amazon video','service'] | 'prime video service'
//        ['breuggers bagels', 'food'] | 'BRUEGGERS bagels'
//        ['breuggers bagels', 'food'] | "sq *BRUEGGER'S bagels"
//        ['apple online','service'] | 'APL*ITUNES online'
//        ['apple online','service'] | 'apple.com online'
//        ['consumer reports','service'] | 'consumerreports yearly subscription'
//        ['consumer reports','service'] | 'CONSUMERRPRTS yearly subscription'
//        ['consumer reports','service'] | 'cr *consumer yearly subscription'
//        ['consumer reports','service'] | 'cr digital media yearly subscription'
//        ['stl yellow cab','travel'] | 'cnty/yllw cab ladue to creve coeur'
        ['state farm insurance','autos'] | 'STATE FARM INSURANCE 800-956-6310 IL'
        ['uber rides','travel'] | 'UBER TRIP HELP.UBER.COM CA'
    }
}