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

  IMAGE_DIRECTORY="$HOME/Desktop/Code/amber-health/public/img"

  if [ ! -e "$IMAGE_DIRECTORY/$FEATURED_IMAGE" ]; then
    echo -e "image \"$FEATURED_IMAGE\" not found. Opening images folder so you can add it now. Please make sure to give it the same name.\n"
    
    open $IMAGE_DIRECTORY
  fi

  echo -e "Waiting for you to add $FEATURED_IMAGE. Once you have added it, type \"proceed\" to continue.\n"

  read RESPONSE

  if [[ $RESPONSE == "proceed" ]]; then
    echo "featuredimage: /img/$FEATURED_IMAGE" >> $FILE_PATH
  else
    echo -e "You'll need to add your image to the markdown in the editor\n"
    echo "featuredimage: /img/ADD IMAGE NAME AND EXTENSION HERE" >> $FILE_PATH
  fi

  # make tags

  echo -e "--- \n" >> $FILE_PATH
}
