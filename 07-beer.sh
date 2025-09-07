#!/bin/sh

echo "Let's sing a beer song"
echo "How many bottles?"
read count

while [ $count -ge 0 ]; do
    if [ $count -ge 2 ]; then
        echo "$count bottles of beer on the wall, $count bottles of beer"
        echo "Take one down pass it around"
    elif [ $count -eq 1 ]; then
        echo "$count bottle of beer on the wall, $count bottles of beer"
        echo "Take one down pass it around"
    else
        echo "no more bottles of beer on the wall"
    fi

    # the following statement is equivalent to: let "count=count-1"
    ((count = count - 1))
done

# exercise: implement another counting song (such as 12 days of Christmas) 
# using loops and if statements.

echo "Now we sing about monkeys jumping on the bed"
echo "How many monkeys?"
read count

while [ $count -ge 0 ]; do
    if [ $count -ge 2 ]; then
        echo "$count little monkeys jumping on the bed"
        echo "one fell off and bumped his head"
        echo "Moma called the doctor and the doctor said"
        echo "No more monkeys jumping on the bed!"
    else
        echo "$count little monkey jumping on the bed"
        echo "He fell off and bumped his head"
        echo "Moma called the doctor and the doctor said"
        echo "No more monkeys jumping on the bed!"
    fi

    ((count = count - 1))

done

printf "\n"

days=("first" "second" "third" "fourth" "fifth" "sixth" "seventh" "eighth" "ninth" "tenth" "eleventh" "twelfth")
gifts=("a partridge in a pear tree 🍐" "turtle doves 🕊️" "French hens 🐔" "calling birds 🐦" "golden rings 💍" "geese a-laying 🪿" "swans a-swimming 🦢" "maids a-milking 🐄" "ladies dancing 💃" "lords a-leaping 👑" "pipers piping 🪈" "drummers drumming 🥁")

echo "Now we sing about Christmas! 🎄"
echo "How many days of Christmas?"
read count
if [[ $count -ge 1 ]] && [[ $count -le 12 ]]; then
    (( count = count - 1))
    while [[ $count -ge 0 ]]; do
        printf "\n"
        echo "On the ${days[count]} day of Christmas my true love gave to me:"
        for (( i=count; i>=0; i-- )); do
            if [[ i -eq 0 ]]; then
                if [[ count -gt 0 ]]; then
                    echo "and ${gifts[i]}"
                else
                    echo "${gifts[i]}"
                fi
            else
                num=0
                (( num = i + 1))
                echo "${num} ${gifts[i]}"
            fi
        done
        (( count = count - 1 ))
    done
else
    printf "\nInvalid number of days given\n"
    exit 1
fi
