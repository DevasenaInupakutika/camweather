#!/bin/sh

make clean
rm -f ../extdata/*

## daily data
make data
rm -f daily-text/*~
mv daily-text/* ../extdata/.

## full data
make data2
R --vanilla < makedata2.R

make clean
