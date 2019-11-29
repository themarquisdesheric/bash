#!/bin/bash

# templates a new markdown article for The Chronic site

function createArticle() {
  CURRENT_DATE=`date +%Y-%m-%d`

  echo -e "\nPlease enter a title for your article:\n"
  read TITLE

  KEBAB_CASE_TITLE=${TITLE// /-}
  LOWER_KEBAB_CASE=$(echo $KEBAB_CASE_TITLE | tr '[:upper:]' '[:lower:]')
  FILE_PATH="$HOME/Desktop/Code/amber-health/$CURRENT_DATE-$LOWER_KEBAB_CASE.md"

  echo -e "--- \ntemplateKey: article" > $FILE_PATH
  echo "title: $TITLE" >> $FILE_PATH


  echo "date: $CURRENT_DATE" >> $FILE_PATH

  echo -e "\nPlease enter a description:\n"
  read DESCRIPTION
  echo "description: $DESCRIPTION" >> $FILE_PATH

  echo -e "\nPlease enter the image name (with extension):\n\nExample: pom-2.jpg\n"
  read FEATURED_IMAGE

  # check if image exists. If not, open images directory

  echo "featuredimage: /img/$FEATURED_IMAGE" >> $FILE_PATH

  # make tags

  echo -e "--- \n" >> $FILE_PATH
}
