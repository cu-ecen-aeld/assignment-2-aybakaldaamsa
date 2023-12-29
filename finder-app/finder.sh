#!/bin/sh

# Author: Aybak AL-Daamsa



#check if the number of arguments is correcrt

if  [ "$#" -ne 2 ]
then

   echo "Erro: Please porvide a correct number of arguments"
   exit 1
fi
  
  

filesdir="$1"
searchstr="$2"

#check if the number of arguments is correcrt
if [ -z "$filesdir" ] || [ -z "$searchstr" ]
then
   echo "Error:Arguments cannot be empty"
   exit 1 
fi

if [ ! -d "$filesdir" ]
then 
    echo "Error : the file $filesdir dosenot exist "
    exit 1
fi

num_files=$(find "$filesdir" -type f| wc -l)
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l )
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

exit 0

