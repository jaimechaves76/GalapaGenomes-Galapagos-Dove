#!/bin/bash

threads=96
telo=CCCTAA  # lex lower of TTAGGG vert telo motif

hifi_reads=m84286_250729_002700_s2_GalDove.cln.fq.gz

hifiasm.sh -t $threads --telo-m $telo $hifi_reads
