#!/bin/bash

threads=96
telo=CCCTAA  # lex lower of TTAGGG vert telo motif

hifi_reads="/home/ejasinskidriggs/galapagos_dove_project/genome_dove/GalapaGenomes-Galapagos-Dove/output/03.clean_adapters/m84286_250729_002700_s2_GalDove.cln.fq.gz"

hifiasm.sh -t $threads --telo-m $telo $hifi_reads
