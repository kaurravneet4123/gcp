# basic metaphlan dsub script

export MY_PROJECT=mhra-ngs-dev-pfgh

#echo Enter  your Prpject name:
#read MY_PROJECT

dsub \
        --provider 'google-cls-v2' \
        --name metaphlan-multi \
	--project ${MY_PROJECT} \
        --regions europe-west2  \
        --location europe-west2  \
        --network ${MY_PROJECT}-network  \
        --subnetwork mhra-ngs-dev-eu-west2-2  \
        --service-account nextflow-vm@${MY_PROJECT}.iam.gserviceaccount.com  \
        --preemptible \
	--retries 1 \
	--logging gs://${MY_PROJECT}-output/meta-logs  \
	--min-cores 4 \
	--min-ram 16 \
        --image  quay.io/biocontainers/metaphlan:3.0.14--pyhb7b1952_0 \
	--tasks ~/gcsfuse/mhra-ngs-dev-pfgh_input/dsub/examples/metaphlan/my-tasks.tsv \
	--script ~/gcsfuse/mhra-ngs-dev-pfgh_input/dsub/examples/metaphlan/dsub-metaphlan.sh \
	--wait \
	--summary

#parameters
# GLS beta executor. change to 'local' for testing on vm
# name for job
# your project id. captured by $project_id environmental variable
#where compute engine reosurces spun up # do not change!!
# your projects network and subnet
 #the service account used to authenticate to GLS API
#execute on preemptible vms
# logs from the process
 # docker container to run the pipeline - check out biocontainers, dockerhub, gcr
#wait for all jobs to finish
#provide summary on each iteration of the loop
# min ram and min core: automatically selects the smallest machine type available that fits this config
