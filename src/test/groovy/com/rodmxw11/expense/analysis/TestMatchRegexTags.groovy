package com.rodmxw11.expense.analysis

import spock.lang.*
import com.rodmxw11.expense.analysis.MatchRegexTags

class TestMatchRegexTags extends Specification {
    def "test MatchRegexTags CTOR"() {
        def sed_line = 's/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g'

        given:
        def match_regex = new MatchRegexTags(sed_line)

        expect:
        match_regex!=null
        match_regex.tag_regex!=null
        match_regex.tags!=null
        match_regex.tags.size() == 2
        match_regex.tags[0] == 'helicopter solutions'
        match_regex.tags[1] == 'travel'

        ['helicopter solutions','travel']==match_regex.matchTags('helicopter solutions NA, LTD')
    }

    def "test MatchRegexTags CTOR data driven"() {
        given:
        def match_regex = new MatchRegexTags(sed_line)

        expect:
        match_regex!=null
        match_regex.tag_regex!=null
        match_regex.tags!=null
        match_regex.tags == expected_tags

        expected_tags==match_regex.matchTags(sample_description)

        where:
        sed_line | expected_tags | sample_description
        's/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g' | ['helicopter solutions','travel'] | 'helicopter solutions NA, LTD'
        's/"HIBACHI.*"/"hibachi grill:food"/g' | ['hibachi grill','food'] | 'hibachi-seasoning in RTP'
        's/"HOT TOPIC.*"/"hot topic myrtle beach:travel"/g' | ['hot topic myrtle beach', 'travel'] | 'hot topical paradise'
        's/"Amazon ?Prime.*"/"amazon.com:delivery"/g' | ['amazon.com','delivery'] | 'amazonprime books'
        's/"Amazon ?Prime.*"/"amazon.com:delivery"/g' | ['amazon.com','delivery'] | 'amazon prime books'
        's/"(Amazon Video|Prime Video).*"/"amazon video:service"/g' | ['amazon video','service'] | 'amazon video service'
        's/"(Amazon Video|Prime Video).*"/"amazon video:service"/g' | ['amazon video','service'] | 'prime video service'
        '''s/"(BRUEGGERS|SQ \\*BRUEGGER'S BAGELS).*"/"breuggers bagels:food"/g''' | ['breuggers bagels', 'food'] | 'BRUEGGERS bagels'
        '''s/"(BRUEGGERS|SQ \\*BRUEGGER'S BAGELS).*"/"breuggers bagels:food"/g''' | ['breuggers bagels', 'food'] | "sq *BRUEGGER'S bagels"
        's/"(APL\\*|APPLE\\.COM).*"/"apple online:service"/g' | ['apple online','service'] | 'APL*ITUNES online'
        's/"(APL\\*|APPLE\\.COM).*"/"apple online:service"/g' | ['apple online','service'] | 'apple.com online'
        's/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \\*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g' | ['consumer reports','service'] | 'consumerreports yearly subscription'
        's/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \\*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g' | ['consumer reports','service'] | 'CONSUMERRPRTS yearly subscription'
        's/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \\*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g' | ['consumer reports','service'] | 'cr *consumer yearly subscription'
        's/"(CONSUMERREPORTS|CONSUMERRPRTS|CR \\*CONSUM|CR DIGITAL M).*"/"consumer reports:service"/g' | ['consumer reports','service'] | 'cr digital media yearly subscription'
        's/"CNTY\\/YLLW CAB.*"/"stl yellow cab:travel"/g' | ['stl yellow cab','travel'] | 'cnty/yllw cab ladue to creve coeur'
    }
}
