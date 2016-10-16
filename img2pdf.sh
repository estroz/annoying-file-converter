#!/bin/bash

echo -n "Which assignment is this? Enter assignment number: "
read assign_num
if [[ "$assign_num" -gt 0 && "$assign_num" -lt 5 ]]
 then
  echo -n "Which file extension are you converting (one of .JPG|.jp[e]g|.PNG|.png|.TIFF|.tiff|.GIF|.gif): "
  read file_ext
  case "$file_ext" in .JPG|.jpeg|.jpg|.PNG|.png|.TIFF|.tiff|.GIF|.gif)
	 # reads in all files of name type q1a."$file_ext" and outputs pdf's
   while read -r image_name; do
     file_name=$(basename "$image_name")
     dest_file="assign$assign_num${file_name/$file_ext/.pdf}"
     convert "$image_name" "$dest_file"
     printf "Converting %s to %s\n" "${image_name#./}" "$dest_file"
   done < <(find . -maxdepth 1 -type f -regextype posix-extended -regex '^./q[1-9]{1,2}[a-z]?'${file_ext}'$')
	 # combines questions with multiple associated pdf's into one pdf
	 for f in {1..9}; do
     assign_list=$(find . -type f -name 'assign'${assign_num}'q'${f}'*')
     [[ -z "$assign_list" ]] && break;
		 pdfunite $assign_list assign${assign_num}q${f}.pdf
	 done
   ;;
   *)
    echo "Not an acceptable file extension, retry."
    exit
   ;;
   esac
 else
  echo "Incorrect assignment number, retry."
fi
