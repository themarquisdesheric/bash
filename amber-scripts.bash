#!/bin/bash

# templates a new markdown article for The Chronic site

function createArticle() {
  CURRENT_DATE=`date +%Y-%m-%d`

  echo -e "\n\033[36m Please enter a title for your article: \033[00m\n"
  read TITLE

  KEBAB_CASE_TITLE=${TITLE// /-}
  LOWER_KEBAB_CASE=$(echo $KEBAB_CASE_TITLE | tr '[:upper:]' '[:lower:]')
  FILE_PATH="$HOME/Desktop/Code/amber-health/$CURRENT_DATE-$LOWER_KEBAB_CASE.md"

  echo -e "--- \ntemplateKey: article" > $FILE_PATH
  echo "title: $TITLE" >> $FILE_PATH

  echo "date: $CURRENT_DATE" >> $FILE_PATH

  echo -e "\n\033[36m Please enter a description: \033[00m\n"
  read DESCRIPTION
  echo "description: $DESCRIPTION" >> $FILE_PATH

  echo -e "\n\033[36m Please enter the image name (with extension):\n\n\033[32m Example: pom-2.jpg \033[00m\n"
  read FEATURED_IMAGE

  # check if image exists. If not, open images directory

  IMAGE_DIRECTORY="$HOME/Desktop/Code/amber-health/public/img"

  if [ ! -e $IMAGE_DIRECTORY/$FEATURED_IMAGE ]; then
    echo -e "\n\033[31m image \"$FEATURED_IMAGE\" not found. Opening images folder so you can add it now. Please make sure to give it the same name. \033[00m\n"
    
    open $IMAGE_DIRECTORY
  fi

  echo -e "featuredimage: /img/$FEATURED_IMAGE\ntags:\n  - MAKE\n  - THESE\n  - TAGS\n--- \n" >> $FILE_PATH

  code $FILE_PATH
}
