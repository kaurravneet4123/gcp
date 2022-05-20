# basic dsub script for single task

#replace the MY_PROJECT value with your project
#export MY_PROJECT=mhra-ngs-dev-pfgh


echo Enter your project name:
read MY_PROJECT


set -o errexit
set -o nounset


dsub  \
        --provider google-cls-v2  \
        --name dsub-${MY_PROJECT}-cutadapt \
	--project ${MY_PROJECT} \
        --regions europe-west2  \
        --location europe-west2  \
        --network ${MY_PROJECT}-network  \
        --subnetwork mhra-ngs-dev-eu-west2-1  \
        --service-account nextflow-vm@${MY_PROJECT}.iam.gserviceaccount.com \
	--preemptible \
	--logging gs://${MY_PROJECT}-output/logs  \
        --input RAW=gs://${MY_PROJECT}-input/test-data/test_278_sub_chr21_1.fastq.gz  \
        --output TRIM=gs://${MY_PROJECT}-output/test/test_278_sub_chr21_1_trimmed.fastq.gz \
        --image  'quay.io/biocontainers/cutadapt:4.0--py37h8902056_0' \
        --command 'cutadapt -q30 -o $TRIM $RAW'  \
	--wait \
	--summary

