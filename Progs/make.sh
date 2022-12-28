#!/usr/bin/env bash
PATH_TO_FORTRESS_DIRECTORY="../../fortress"

./cppreqcc
./cpqccx /O2

# If we compiled successfully, prozac.dat will have been put in "..".
if test -f "../prozac.dat"; then
    mv ../prozac.dat $PATH_TO_FORTRESS_DIRECTORY/qwprozac.dat
    cp progdefs.h ../PQWSV/src/progdefs.h
fi

./clean.sh
