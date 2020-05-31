#!/bin/bash
cat << OPTIONS
        [1] Download a specific thumbnail
        [2] Download ALL thumbnails
        [3] Download images in a range
        [4] Quit
OPTIONS
read -p "Choose a number 1 - 4: " optionNumber

if [[ $optionNumber == 1 ]]
then
    echo "----------- Download a specific thumbnail ------------"
    read -p "Enter Thumbnail identification: " image
    # echo "The image is $image"
    # get a specific images and download it
    wget --output-document=$image.jpg https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/$image.jpg

elif [[ $optionNumber == 2 ]]
then
    echo "----------- Download ALL thumbnails -----------"
    content=$(wget https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152 -q -O -)
    # echo $content
    # get all the pages
    curl 'https://www.ecu.edu.au/service-centres/MACSC/gallery/gallery.php?folder=152' -o '#1.html'
    # get all images
    grep -oh 'https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/.*jpg' *.html > urls.txt

    # download all images
    sort -u urls.txt | wget -i- urls.txt

elif [[ $optionNumber == 3 ]]
then
    echo "----------- Download images in a range -----------"
    read -p "Starting Range: " startRange
    read -p "Ending Range: " endRange
    # echo "Starting range is $startRange"
    # echo "Ending range is $endRange"

    # get a ranges of images and download it
    wget https://secure.ecu.edu.au/service-centres/MACSC/gallery/152/DSC0{1533..1543}.jpg

elif [[ $optionNumber == 4 ]]
then
    echo "Exiting the script..."
    exit
fi