#!/bin/bash
filename='rectangle.txt'

n=1
{
    read
    while IFS=, read -r name height width area colour || [ -n "$line" ] ; do
    cat rectangle.txt | sed 's/<[^>]\+>//g' >> rectangle_f.txt
        #echo -e "Name:$name   Height:$height   Width:$width   Area:$area   Colour:$colour" >> rectangle_f.txt 
  
        n=$((n+1))
    done

}< $filename
 #sed 's/\s\s\+/:/g;s/\([a-z)]\)\s\([(0-9A]\)/\1:\2/g' rectangle_f.txt | column -s: -t

exit 0

