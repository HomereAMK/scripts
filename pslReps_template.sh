#!/bin/bash
#PBS -A bpv-355-aa
#PBS -N pslReps
#PBS -o pslReps.out
#PBS -e pslReps.err
#PBS -l walltime=02:00:00
#PBS -M jeremy.le-luyer.1@ulaval.ca
#PBS -m ea 
#PBS -l nodes=1:ppn=8
#PBS -r n

module load compilers/gcc/4.8  apps/mugqic_pipeline/2.1.1
module load mugqic/blat/36


#pslReps /home/leluyer/output_blat_chr.psl out_pslReps_chr.psl out_pslReps_chr.psr

#pslReps /home/leluyer/output_blat_mrna.psl out_pslReps.psl out_pslReps_mrna.psr

pslReps /home/leluyer/output_all_trinity_mrna.psl out_pslReps_all_mrna.psl out_pslReps_mrna_all_mrna.psr
#usage:
#    pslReps in.psl out.psl out.psr
#where:
#    in.psl is an alignment file generated by psLayout and sorted by pslSort
#    out.psl is the best alignment output
#    out.psr contains repeat info
#options:
#    -nohead            Don't add PSL header.
#    -ignoreSize        Will not weigh as much in favor of larger alignments.
#    -noIntrons         Will not penalize for not having introns when calculating
#                       size factor.
#    -singleHit         Takes single best hit, not splitting into parts.
#    -minCover=0.N      Minimum coverage to output.  Default is 0.
#    -ignoreNs          Ignore Ns when calculating minCover.
#    -minAli=0.N        Minimum alignment ratio.  Default is 0.93.
#    -nearTop=0.N       How much can deviate from top and be taken.
#                       Default is 0.01.
#    -minNearTopSize=N  Minimum size of alignment that is near top
#                       for alignment to be kept.  Default 30.
#    -coverQSizes=file  Tab-separate file with effective query sizes.
#                       When used with -minCover, this allows polyAs
#                       to be excluded from the coverage calculation.
