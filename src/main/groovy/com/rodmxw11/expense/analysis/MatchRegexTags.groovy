package com.rodmxw11.expense.analysis

import java.util.regex.Matcher
import java.util.regex.Pattern
import groovy.transform.CompileStatic

/**
 * Lookup tags for a credit card line item description using Regex patterns
 */
@CompileStatic
class MatchRegexTags {
    static final String SED_PARSER_REGEX = '''(?x)^ # with comments
  s/
  "(.*?)" # regex for description
  /
  "(.*?):(.*?)"  # tags
  /g$
'''
    static final Pattern sed_parser = Pattern.compile(SED_PARSER_REGEX)

    Pattern tag_regex;
    List<String> tags;

    /**
     * Constructor takes a SED expression like
     * <pre>s/"HOT TOPIC.*"/"hot topic myrtle beach:travel"/g</pre>
     * and parses it into a <pre>(?i)^HOT TOPIC.*$</pre> compiled regex pattern
     * and a pair of tags ['hot topic myrtle beach','travel']
     * @param sed_expression a line from the tag-xlate.sed file,
     * like <pre>s/"(LABCORP|LCA\*LABCORP).*"/"lab corp:medical"/g</pre>
     */
    public MatchRegexTags(String sed_expression) {
        Matcher matcher = (sed_expression =~ sed_parser)
        assert matcher.matches(), "ERROR in sed_expression >>$sed_expression<<"
        def (String regex, String tag1, String tag2) = [matcher.group(1), matcher.group(2), matcher.group(3)]
        assert regex && tag1 && tag2
        this.tag_regex = Pattern.compile('(?i)^'+regex+'$')
        this.tags = [tag1,tag2]
    }

    /**
     * Test if a line item description matches this tag_regex, and if so, return the tags for that description
     * @param description
     * @return tags if this tag_regex matches the description, else null
     */
    List<String> matchTags(String description) {
        return description ==~ tag_regex ? tags : null
    }
}
