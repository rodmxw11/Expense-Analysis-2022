package com.rodmxw11.expense.analysis

import java.util.regex.Matcher
import java.util.regex.Pattern
import groovy.transform.CompileStatic

/*
------------ Sample sed expressions that match a regex with tags ---------
s/"HELICOPTER SOL.*"/"helicopter solutions:travel"/g
s/"HIBACHI.*"/"hibachi grill:food"/g
s/"HOT TOPIC.*"/"hot topic myrtle beach:travel"/g
s/"HOLYLAND OLIVE.*"/"holyland olive wood:retail"/g
s/"HUDSONNEWS.*"/"hudson news:retail"/g
s/"IDPARTS.*"/"idparts:autos"/g
 */

@CompileStatic
class ClassifyCsvRow {
    static final List<String> UNKNOWN_TAGS = ['_unknown','_unknown']
    List<MatchRegexTags> tag_lookup_list = new ArrayList<>()

    int getRegexCount() {
        return tag_lookup_list.size()
    }

    public ClassifyCsvRow(List<String> sed_expressions) {
        assert sed_expressions
        sed_expressions.each {
            String sed_expr
            ->
                String sed_expr_trim = sed_expr.trim()
                if (
                        sed_expr_trim==''
                    || sed_expr_trim.startsWith('#')
                    || sed_expr_trim == 's/"& /"/g'
                    || sed_expr_trim == 's/://g'
                ) {
                    return
                }
                tag_lookup_list << new MatchRegexTags(sed_expr)
        }
    }

    public ClassifyCsvRow(File sed_expression_file) {
        this(sed_expression_file.readLines())
    }

    List<String> lookupTags(String item_description) {
        return tag_lookup_list.stream()
                .filter(tag_matcher -> tag_matcher.matchTags(item_description)!=null)
                .map(tag_matcher -> tag_matcher.tags)
                .findFirst()
                .orElse(UNKNOWN_TAGS)
    }
}
