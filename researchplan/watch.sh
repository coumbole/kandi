#!/bin/bash

inotifywait -mq -e close_write,moved_to --format %e/%f . |
while IFS=/ read -r events file; do
  if [ "$file" = "resplan.tex" ]; then
      echo $file
      pdflatex $file > pdflatex.log
  fi
done
