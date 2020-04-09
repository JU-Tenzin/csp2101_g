#!/bin/bash
# this program is a game that asks a user to guess an age between 20 and 70

echo "Hello, "${USER}
guess=1
## Start loop of game here
while true; do
n1=$[ 20 + RANDOM % (70 + 1 - 20)]
echo "This is a game where you can guess an age from 20-70"
echo -n "Please enter your guess: "

while read n2; do
    if [[ $n2 -eq $n1 ]]; then
        break;
    else
        if [[ $n2 -gt $n1 ]]; then
            echo  "The age you guessed is high!"
            echo  -n "Try again:  "
        elif [[ $n2 -lt $n1 ]]; then
            echo  "The age you guessed is low!"
            echo  -n "Try again:  "
        fi
    fi
    guess=$(( $guess + 1 ))
done
echo
echo "Congratulations! You win!"
if [[ $guess == 1 ]]; then
    echo "It took you $guess guess to get $n1."
else
    echo "It took you $guess guesses to get $n1."
fi
echo

read -p "Do you want to try again (y/n)? " choice
case $choice in
    [Yy]* ) guess=1;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
esac
## End loop of game here
done
