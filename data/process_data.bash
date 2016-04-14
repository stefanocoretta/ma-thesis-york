#!/bin/bash

cat is.dic > is.txt

mkdir processed
cd processed

gawk 'BEGIN {
    FS = ""
}

{
    for(i = 1; i <= NF; i++)
        {chars[$(i)] = $(i);}
}

END {
    for(c in chars)
        {print c;}
}' ../is.txt > is_alphabet.txt
gawk '/^[[:lower:]]/' ../is.txt > is_lower.txt

# CVCC (stops only)
gawk --posix '/^[bcdgkpt][aeiouyö]((b{2})|(c{2})|(d{2})|(g{2})|(k{2})|(p{2})|(t{2}))$/' \
    is_lower.txt > is_cvcc_stops.txt

# CVCCV (stops only)
gawk --posix '/^[bcdgkpt][aeiouyö]((b{2})|(c{2})|(d{2})|(g{2})|(k{2})|(p{2})|(t{2}))[aeiouyö]$/' \
    is_lower.txt > is_cvccv_stops.txt

cat is_cvcc_stops.txt | rev | sort | rev > is_cvcc_rev_sort.txt
cat is_cvccv_stops.txt | rev | sort | rev > is_cvccv_rev_sort.txt

# CVNC
gawk --posix '/^[bcdgkpt][aeiouyö][mn][bcdgkpt]$/' is_lower.txt > is_cvnc_stops.txt

# CVNCV
gawk --posix '/^[bcdgkpt][aeiouyö][mn][bcdgkpt][aeiouyö]$/' is_lower.txt > is_cvncv_stops.txt

# sort --key=1.2,1.2 is_cvcc_stops.txt
# sort --key=1.2,1.2 is_cvccv_stops.txt

