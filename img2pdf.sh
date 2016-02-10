#!/bin/bash

echo -n "Which assignment is this? Enter assignment number: "
read aNum
if [[ "$aNum" -gt 0 && "$aNum" -lt 5 ]]
 then
  echo -n "Which file extension are you converting (with '.' prefix): "
  read fExt
  case "$fExt" in
   .JPG|.jpeg|.PNG|.png|.TIFF|.tiff|.GIF|.gif)
   echo "Aww yiss!"

	 # reads in all files of name type q1a."$fExt" and outputs pdf's
   while read -r name; do 
     fileName=$(basename "$name")
     convert "$name" "assign$aNum${fileName/$fExt/.pdf}"
     printf "Converting %s to %s\n" "$name" "assign$aNum${fileName/$fExt/.pdf}"
   done < <(find . -maxdepth 1 -type f -regextype posix-extended -regex '^./q[1-9]{1,2}[a-z]?'"$fExt"'$')
	 
	 # makes arbitrary error output file in case multiple pdf files don't exist for a particular question
	 touch blehhh123.txt
	 
	 # combines questions with multiple pdf's associated into one pdf file
	 for f in {1..9}; do 
		 pdfunite assign"$aNum"q$f* assign"$aNum"q$f.pdf &> ./blehhh123.txt;
	 done
	 
	 # removes arbitrary output file
	 rm ./blehhh123.txt
   ;;
   *)
    echo "Not an acceptable file extension, retry."
   ;;
   esac
 else
  echo "Incorrect entry, retry."
fi


