#!/bin/bash

grep _unknown ../csv/*statement*.csv | cut -d, -f4-8 | sort