#!/usr/bin/env bash
PATH_TO_FORTRESS_DIRECTORY="../../fortress"
PATH_TO_RESULTING_PROGSDAT="../qwprozac.dat"

./cppreqcc
./cpqccx /O2

# If we compiled successfully, qwprozac.dat will have been put in "..".
if test -f $PATH_TO_RESULTING_PROGSDAT; then
    mv $PATH_TO_RESULTING_PROGSDAT $PATH_TO_FORTRESS_DIRECTORY/qwprozac.dat
    cp progdefs.h ../PQWSV/src/progdefs.h
else
    echo "Couldn't find output file, $PATH_TO_RESULTING_PROGSDAT!"
fi

./clean.sh
