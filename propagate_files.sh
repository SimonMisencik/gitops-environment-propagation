#!/bin/sh -l

echo "source_enviroment: $1"
echo "target_enviroment: $2"
echo "prefix_folder: $3"
echo "suffix_folder: $4"
echo "secrets_promotion: $5"

if [ $5 == 'false']; then
  rsync -avc --del --exclude='*-secret.yaml' --exclude="$1-values.yaml" --exclude="$2-values.yaml" --exclude='develop-values.yaml' $3/$1/$4/ $3/$3/$4
else
  rsync -avc --del --exclude="$1-values.yaml" --exclude="$2-values.yaml" --exclude='develop-values.yaml' $3/$1/$4/ $3/$3/$4
fi
