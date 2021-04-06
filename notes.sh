#!/bin/bash
# check processor has ssse3 instructions - requirement for GeneMark and Diamond
# write test!

# Setup GeneMark ES/ET/EP Key
#wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_W1C3F/gm_key_64.gz
wget http://topaz.gatech.edu/GeneMark/tmp/GMtool_UfdZ7/gm_key_64.gz
gunzip gm_key_64.gz
cp gm_key_64 ~/.gm_key
cp gm_key_64 ~/.gm_key_64

# How to configure the RepeatMasker container for proper usage
# https://sylabs.io/guides/3.5/user-guide/persistent_overlays.html
# dd if=/dev/zero of=rm_overlay.img bs=1M count=500 && mkfs.ext3 rm_overlay.img
# singularity shell --overlay rm_overlay.img RepeatMasker.sif

# need to configure repeat masker, repeat modeler, and recon, using an overlay
# using the same overlay for all seems to work

java -jar /opt/Trimmomatic/trimmomatic-0.39.jar PE /projects/ssander/rattles/SRR628245_1.fastq /projects/ssander/rattles/SRR628245_2.fastq /projects/ssander/rattles/rattles_rnaseq_pe_1.fq.gz /projects/ssander/rattles/rattles_rnaseq_pe_2.fq.gz /projects/ssander/rattles/rattles_rnaseq_se_1.fq.gz /projects/ssander/rattles/rattles_rnaseq_se_2.fq.gz ILLUMINACLIP:/opt/Trimmomatic-0.39/adapters/all_adapters.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:36