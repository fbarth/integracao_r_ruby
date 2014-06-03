#!/bin/bash

time Rscript -e "source('create_dataframe.R')"
time Rscript -e "source('test_use_function_with_dataframe.R')"

