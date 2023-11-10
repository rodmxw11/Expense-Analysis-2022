#!/bin/sh

data_dir=../csv
cat ${data_dir}/*statement*.csv | cut -d, -f4 | tr -d '"' | tr '[:upper:]' '[:lower:]' | sort | uniq -c