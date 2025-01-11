# Author: S Sevilla
# Date: 1/8/25
# Description: Run script which deploys the nextflow workflow

# Input args
profile=$1 
input=$2
outDir=$3
projectID=$4


# housekeeping
#if [[ -z $outDir || -z $input || -z $profile || -z $projectID ]]; then echo "All variables are required: profile input outDir projectID"; exit; fi
if [[ -z $outDir || -z $input || -z $profile ]]; then echo "All variables are required: profile input outDir projectID"; exit; fi
if [[ -z $projectID ]]; then echo -e "WARNING: variable 'projectID' not defined.\nSetting variable 'projectID' equal to 'testProject'\n\nAll variables are required: profile input outDir projectID"; fi

if [[ ! -d $outDir ]]; then mkdir -p $outDir; fi

# run the workflow
nextflow run main.nf \
	-profile $profile \
	--input $input \
	--outdir $outDir \
 	--projectID $projectID \
	-resume
