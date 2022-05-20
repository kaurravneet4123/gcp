# basic dsub script with comments

dsub  \
        --provider google-cls-v2  \ # GLS beta executor. change to 'local' for testing on vm
        --name dsub-${MY_PROJECT}-cutadapt \ # name for job
	--project ${MY_PROJECT} \ # your project id. captured by $project_id environmental variable
        --regions ${MY_REGION}  \ #where compute engine reosurces spun up # do not change!!
        --location ${MY_LOCATION}  \  # where job executions are deployed to GLS API. GLS API only stores pipeline execution metadata in certain regions #Do not change!! 
        --network ${MY_PROJECT}-network  \ # your projects network and subnet
        --subnetwork mhra-ngs-dev-eu-west2-2  \
        --service-account nextflow-vm@${MY_PROJECT}.iam.gserviceaccount.com  \ #the service account used to authenticate to GLS API
        --preemptible \ #execute on preemptible vms
	--logging gs://${MY_PROJECT}-output/logs  \ # logs from the process
        --input RAW=gs://${MY_PROJECT}-input/test-data/test_278_sub_chr21_1.fastq.gz  \
        --output TRIM=gs://${MY_PROJECT}-output/test/test_278_sub_chr21_1_trimmed.fastq.gz  \
        --image  'quay.io/biocontainers/cutadapt:4.0--py37h8902056_0' \ # docker container to run the pipeline - check out biocontainers registry (quay.io/biocontainers)
        --command 'cutadapt -q30 -o $TRIM $RAW'  \
	--wait \ #wait for all jobs to finish
	--summary #provide summary on each iteration of the loop
