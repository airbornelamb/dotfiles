#!/bin/bash

#This will create a handout by inserting blank pages and n'upping 
#so that there is a landscape printout 
#with original pdf on one side and blank pages on the other.

command -v ps2pdf >/dev/null 2>&1 || { echo "You need to install Ghostscript for this script to run" >&2; exit 1;}
command -v pdftk >/dev/null 2>&1 || { echo "You need to install pdftk for this script to run" >&2; exit 1;}
command -v pdfnup >/dev/null 2>&1 || { echo 'You need to install PDFjam for this script to run. Get from https://warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam/#download' >&2; exit 1;}

if [ $# -ne 1 ]
then
  echo "Usage example: notesmaker src.pdf"
  exit $E_BADARGS
else
  NUM=$(pdftk $1 dump_data | grep 'NumberOfPages' | awk '{split($0,a,": "); print a[2]}')
  COMMSTR=''

  for i in $(seq 1 $NUM);
  do
    COMMSTR="$COMMSTR A$i B1 " 
  done
  $(echo "" | ps2pdf -sPAPERSIZE=letter - pageblanche.pdf)
  $(pdftk A=$1 B=pageblanche.pdf cat $COMMSTR output 'mod_'$1)
  (pdfnup 'mod_'$1 --nup 2x1 --landscape --outfile 'print_'$1)
  $(rm pageblanche.pdf && rm 'mod_'$1)

fi

#for f in *.pdf; do notesmaker.sh $f; done 2> /dev/null
