#!/bin/bash
#
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#################
#set a job name
#SBATCH --job-name=snakemake
#################
#a file for job output, you can check job progress
#SBATCH --output=snake.%j.out
#################
# a file for errors from the job
#SBATCH --error=snake.%j.err
#################
#time you think you need; default is one hour
#in minutes in this case
#SBATCH -t 72:00:00
#################
#quality of service; think of it as job priority
#SBATCH -p amilan128c,amilan
#SBATCH --qos=long
#################
#number of nodes
#SBATCH --nodes=1
#SBATCH --ntasks-per-node 1
#################
#SBATCH --mem=3G
#################
#get emailed about job BEGIN, END, and FAIL
#SBATCH --mail-type=END
#################
#who to send email to; please change to your email
#SBATCH  --mail-user=rafael.rico@ebd.csic.es
#################
#now run normal batch commands
##################
#echo commands to stdout

set -x

source ~/.bashrc
conda activate snakemake-7.7.0

snakemake --profile hpcc-profiles/slurm/alpine --configfile example-configs/PCUL-Sep-2025/config.yaml --until get_ave_depths
