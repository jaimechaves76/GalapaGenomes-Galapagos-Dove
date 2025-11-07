#!/bin/bash

out="/home/home/ejasinskidriggs/galapagos_dove_project/genome_dove/GalapaGenomes-Galapagos-Dove/output/01.convert_bam_to_fastq/m84286_250729_002700_s2_GalDove.fastq"
in="/home/home/ejasinskidriggs/galapagos_dove_project/genome_dove/GalapaGenomes-Galapagos-Dove/data/Genome_PACBIO/r84286_20250729_002356_1_A01/01.RawData/m84286_250729_002700_s2.hifi_reads.bc2033.2009127_GaDo_P2_HMW_ext.bam"
hifibam2fastq.sh $in > $out

gzip -v $out 