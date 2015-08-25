#!/bin/bash

if [ ! -f "$HOME/.bash_env" ]; then
  echo "Create a new .bash_env file using the template file"
  exit -1
fi

FILES=./files/*
for f in $FILES
do
  filename=$(basename $f)
  destination="$HOME/.$filename"

  con="Y"
  echo $destination
  if [ -f $destination ]; then
    echo "Overwrite $filename? (Y/n)"
    read con
  fi

  if [ "$con" == "Y" ]; then
    ln -snf $PWD/$f ~/.$filename
  fi
done

