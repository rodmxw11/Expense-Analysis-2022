#!/bin/bash

# See: https://pdfbox.apache.org/2.0/commandline.html

pdfbox=../lib/pdfbox-app-2.0.24.jar
flags=
inputfile=../data/Amazon-Card/2021/20211104-statements-4220-.pdf
java -jar $pdfbox ExtractText $flags $inputfile ../workspace/text.OUT

