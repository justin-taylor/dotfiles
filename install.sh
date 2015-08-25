#!/bin/bash
FILES=./files/*
for f in $FILES
do
  filename=$(basename $f)
  destination="~/.$f"

  con="Y"
  if [ -f $f ]; then
    echo "Overwrite $filename? (Y/n)"
    read con
  fi

  if [ "$con" == "Y" ]; then
    ln -snf $PWD/$f ~/.$filename
  fi
done

