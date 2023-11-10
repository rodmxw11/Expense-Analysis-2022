#!/bin/sh

data_dir=../csv
cat ${data_dir}/*statement*.csv | cut -d, -f4 | sed -E -f tag-xlate.sed | sort | uniq -c