#!/usr/bin/env bash
PATH_TO_FORTRESS_DIRECTORY="../../fortress"

./cppreqcc
./cpqccx /O2
#pause
mv ../prozac.dat $PATH_TO_FORTRESS_DIRECTORY/qwprozac.dat
./clean.sh
