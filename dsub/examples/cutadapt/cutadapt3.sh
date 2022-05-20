
# basic dsub script for multiple tasks

echo Enter your Project name:
read MY_PROJECT

dsub  \
        --provider google-cls-v2  \
        --name cutadapt-multi \
	--project ${MY_PROJECT} \
        --regions europe-west2  \
        --location europe-west2  \
        --network ${MY_PROJECT}-network  \
        --subnetwork mhra-ngs-dev-eu-west2-1  \
        --service-account nextflow-vm@${MY_PROJECT}.iam.gserviceaccount.com \
	--preemptible \
	--logging gs://${MY_PROJECT}-output/multi-logs  \
        --image  'quay.io/biocontainers/cutadapt:4.0--py37h8902056_0' \
        --tasks ~/gcsfuse/xxxxx_input/dsub/examples/cutadapt/my-tasks.tsv  \
	--script ~/gcsfuse/xxxx_input/dsub/examples/cutadapt/dsub-cutadapt3.sh  \
	--wait \
	--summary

