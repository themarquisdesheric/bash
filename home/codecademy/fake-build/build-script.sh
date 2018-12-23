#!/bin/bash

firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}

echo "### Preparing to build version $version ###"

echo "Enter 1 to continue build or 0 to exit"

read continue

if [ $continue -eq 1 ]
then
	echo "### Building ### "
  
  files=source/*
  
  for file in $files
  do   	
  	if [ "$file" == "source/secretinfo.md" ]
    then
    	echo "Not copying $file"
    else
    	echo "Copying $file"
      cp $file build/.
    fi
  done

  echo "Build version $version contains:"
  
  ls build/
else
	echo "Exiting build"
fi
