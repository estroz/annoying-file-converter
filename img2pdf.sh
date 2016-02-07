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

   while read -r name; do 
     fileName=$(basename "$name")
     convert "$name" "$(dirname "$name")assign$aNum${fileName/$fExt/pdf}"
     printf "Converting %s to %s\n" "$name" "$(dirname "$name")assign$aNum${fileName/$fExt/pdf}"
   done < <(find . -maxdepth 1 -type f -regextype posix-extended -regex '^./q[0-9]{1,2}[a-z]?'"$fExt"'$')
   ;;
   *)
    echo "Not an acceptable file extension, retry."
   ;;
   esac
 else
  echo "Incorrect entry, retry."
fi


