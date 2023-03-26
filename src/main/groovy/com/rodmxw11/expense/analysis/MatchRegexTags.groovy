package com.rodmxw11.expense.analysis

import java.util.regex.Matcher
import java.util.regex.Pattern
import groovy.transform.CompileStatic

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
    public MatchRegexTags(String sed_expression) {
        Matcher matcher = (sed_expression =~ sed_parser)
        assert matcher.matches()
        def (String regex, String tag1, String tag2) = [matcher.group(1), matcher.group(2), matcher.group(3)]
        assert regex && tag1 && tag2
        this.tag_regex = Pattern.compile('(?i)^'+regex+'$')
        this.tags = [tag1,tag2]
    }
    List<String> matchTags(String description) {
        if (description ==~ tag_regex) {
            return tags
        }
        return null
    }
}
