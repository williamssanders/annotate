
PROTEINS=/path/to/protein/file

wget ftp://ftp.ncbi.nih.gov/refseq/daily/rsnc.0413.2021.faa.gz
gunzip rsnc.0413.2021.faa.gz
# convert multi-line FASTA to single-line FASTA
sed -e 's/\(^>.*$\)/#\1#/' rsnc.0413.2021.faa | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > rsnc.0413.2021.faa.cleaned.fasta
# make BLAST DB
singularity exec $CONTAINERS/BLAST.sif /usr/bin/makeblastdb -in rsnc.0413.2021.faa.cleaned.fasta -dbtype prot -out RefSeqProteins
sed -e 's/\(^>.*$\)/#\1#/' $PROTEINS | tr -d "\r" | tr -d "\n" | sed -e 's/$/#/' | tr "#" "\n" | sed -e '/^$/d' > $PROTEINS.cleaned.fasta
singularity exec $CONTAINERS/BLAST.sif /usr/bin/blastp -num_threads 1 -db /data/ssander/blastp/RefSeqProteins -query $PROTEINS.cleaned.fasta -outfmt 6 -out refseq_check.txt
