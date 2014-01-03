#!/bin/sh

make data
rm -f ../extdata/*
rm -f daily-text/*~
mv daily-text/* ../extdata/.
make clean
