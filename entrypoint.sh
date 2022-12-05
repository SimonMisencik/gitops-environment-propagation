#!/bin/sh -l

echo "source enviroment $1"
echo "destination enviroment $2"
echo "preffix $3"
echo "suffix $4"

# rsync -avc --del --exclude='*-secret.yaml' --exclude='${{ inputs.source_env }}-values.yaml' --exclude='${{ inputs.target_env }}-values.yaml' --exclude='develop-values.yaml' frinx-machine/${{ inputs.source_env }}/app/ frinx-machine/${{ inputs.target_env }}/app

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "caute" > test
