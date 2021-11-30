#!/bin/bash

# See: https://pdfbox.apache.org/2.0/commandline.html

pdfbox=pdfbox-app-2.0.24.jar
flags=
inputfile=../Amazon-Card/2021/20211104-statements-4220-.pdf
java -jar $pdfbox PDFDebugger $flags $inputfile
