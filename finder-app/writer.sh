#!/bin/sh

# Author: Aybak AL-Daamsa


#check if the number of arguments is correcrt

if  [ "$#" -ne 2 ]
then
   echo "Erro: Please porvide a correct number of arguments"
   exit 1
fi
   
writefile="$1"
writestr="$2"

if [ -z "$writefile" ] || [ -z "$writestr" ]
then
   echo "Error:Arguments cannot be empty"
   exit 1 
fi

mkdir -p "$(dirname "$writefile")"

echo "$writestr" > "$writefile"

if [ $? -ne 0 ]
then
   echo "Error: FAild to creat the file $writrefile"
   exit 1
fi

echo "The File $writefile created successfully with content: $writestr"

exit 0
