#!/bin/bash
# Setup GeneMark ES/ET/EP Key
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_W1C3F/gm_key_64.gz
gunzip gm_key_64.gz
cp gm_key_64 ~/.gm_key
cp gm_key_64 ~/.gm_key_64
# Testing GeneMark
#mkdir test
#cd test
#/opt/gmes_linux_64/gmes_petap.pl --seq /opt/gmes_linux_64/GeneMark-E-tests/EP/input/genome.fasta --EP --dbep /opt/gmes_linux_64/GeneMark-E-tests/EP/input/proteins.fasta --verbose --cores=4 --max_intergenic 10000
