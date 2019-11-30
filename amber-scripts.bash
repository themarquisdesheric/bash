#!/bin/bash

IMAGE_DIRECTORY="$HOME/Desktop/Code/amber-health/public/img"
ARTICLE_DIRECTORY="$HOME/Desktop/Code/amber-health/src/pages/articles"

# aliases

alias images="open $IMAGE_DIRECTORY"
alias articles="code $ARTICLE_DIRECTORY"
alias preview="npm i && npm run develop"
alias update="git pull && npm i"

#functions

# commits, pulls, and pushes to GitHub

function publish() {
  echo -e "Please provide a short commit message explaining your changes (not more than 50 characters: you can test this in VScode's Source Control tab)\n"

  read COMMIT_MSG

  if [[ ${#COMMIT_MSG} -gt 50 ]]; then
    TRUNCATED_COMMIT_MSG=${COMMIT_MSG:0:50}

    echo -e "\n Message over 50 characters, truncated to:\n $TRUNCATED_COMMIT_MSG \n"

    git commit -m "$TRUNCATED_COMMIT_MSG"
  else
    git commit -m "$COMMIT_MSG"
  fi

  git pull && git push
}

# templates a new markdown article for The Chronic site

function createArticle() {
  CURRENT_DATE=`date +%Y-%m-%d`

  echo -e "\n\033[36m Please enter a title for your article: \033[00m\n"
  read RAW_TITLE

  KEBAB_CASE_TITLE=${RAW_TITLE// /-}
  TITLE=$(echo $KEBAB_CASE_TITLE | tr '[:upper:]' '[:lower:]')
  FILE_PATH="$ARTICLE_DIRECTORY/$CURRENT_DATE-$TITLE.md"

  echo -e "--- \ntemplateKey: article" > $FILE_PATH
  echo "title: $TITLE" >> $FILE_PATH

  echo "date: $CURRENT_DATE" >> $FILE_PATH

  echo -e "\n\033[36m Please enter a description: \033[00m\n"
  read DESCRIPTION
  echo "description: $DESCRIPTION" >> $FILE_PATH

  echo -e "\n\033[36m Please enter the image name (with extension):\n\n\033[32m Example: pom-2.jpg \033[00m\n"
  read FEATURED_IMAGE

  IMAGE_DIRECTORY="$HOME/Desktop/Code/amber-health/public/img"

  if [ ! -e $IMAGE_DIRECTORY/$FEATURED_IMAGE ]; then
    echo -e "\n\033[31m image \"$FEATURED_IMAGE\" not found. Opening images folder so you can add it now. Please make sure to give it the same name. \033[00m\n"
    
    images # open image directory
  fi

  echo -e "featuredimage: /img/$FEATURED_IMAGE\ntags:\n  - MAKE\n  - THESE\n  - TAGS\n--- \n" >> $FILE_PATH

  code $FILE_PATH
}
