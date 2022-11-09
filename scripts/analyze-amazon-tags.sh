#!/bin/sh

data_dir=../temp/text-OUT
cat ${data_dir}/*statement*.csv | cut -d, -f4 | sed -E -f tag-xlate.sed | sort | uniq -c