#!/bin/bash
# check processor has ssse3 instructions - requirement for GeneMark and Diamond
# write test!

# Setup GeneMark ES/ET/EP Key
#wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_W1C3F/gm_key_64.gz
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_UfdZ7/gm_key_64.gz
gunzip gm_key_64.gz
cp gm_key_64 ~/.gm_key
cp gm_key_64 ~/.gm_key_64