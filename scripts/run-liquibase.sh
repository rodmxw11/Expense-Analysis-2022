#!/bin/sh

liquibase=~/JavaPrograms/liquibase-4.6.1/
PATH=$liquibase:$PATH

liquibase --defaultsFile=../src/main/resources/database-config/liquibase.properties $*

