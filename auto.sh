#!/bin/bash

title=$1
file=$(ls ~/Downloads/*.html)

if [ -z $title ];then
  echo "no title"
  exit
fi

if [ -z $file ];then
  file=$(ls ~/Downloads/*.pdf)

  if [ -z $file ];then
    echo "no html|pdf"
    exit
  fi
fi

filename=$(basename "$file")

mv $file .

perl create-article.pl $filename $title

git add .
git commit -m "$filename"
git push
