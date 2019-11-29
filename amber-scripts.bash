#!/bin/bash

# don't forget to change the path and make it generate the date as filename/date field

# generate a new article for The Chronic
function createArticle() {
  # variable for filepath 

  echo -e "--- \ntemplateKey: article" > ~/Desktop/Code/amber-health/article.md
  echo -e "\nPlease enter a title for your article:\n"
  # make intro
  read TITLE
  echo "title: $TITLE" >> ~/Desktop/Code/amber-health/article.md

  CURRENT_DATE=`date +%Y-%m-%d`

  echo "date: $CURRENT_DATE" >> ~/Desktop/Code/amber-health/article.md

  echo -e "\nPlease enter a description:\n"
  read DESCRIPTION
  echo "description: $DESCRIPTION" >> ~/Desktop/Code/amber-health/article.md

  echo -e "\nPlease enter the image name (with extension):\n\nExample: pom-2.jpg\n"
  read FEATURED_IMAGE

  # open images directory here 
  # check if image exists 

  echo "featuredimage: /img/$FEATURED_IMAGE" >> ~/Desktop/Code/amber-health/article.md

  # tags

  echo -e "--- \n" >> ~/Desktop/Code/amber-health/article.md
}
