package com.rodmxw11.expense.analysis.utils

import groovy.sql.Sql
import groovy.transform.CompileStatic
@CompileStatic
class DbHelper {
    Sql db = null

    DbHelper() {
        db = Sql.newInstance(
                'jdbc:h2:./workspace/finance-2022-db', // db.url,
                'sa',  //db.user,
                'sa', //db.password,
                'org.h2.Driver' //db.driver
        )
        assert db!=null
    }

    Map<String,Integer> label_cache = new HashMap<String,Integer>()
    int
}
