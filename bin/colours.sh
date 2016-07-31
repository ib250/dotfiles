#!/bin/zsh
#
# ~/bin/colours
#
# Prints terminal colour scheme information
# Usage: ./colours [-v]

colur_hexes=($(xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2))
colour_names=(black red green yellow blue magenta cyan white)

# add -v argument for verbose output
if [[ $# -eq 1 && $1 == "-v" ]]; then
  printf "┌────────────────────────────────────────────────────┐\n"
  printf "│ preview     name       bash      urxvt       hex   │\n"
  printf "├────────────────────────────────────────────────────┤\n"
  for i in {0..7}
    do
    printf "%-30b" "│\e[0;$((30+$i))m ████████   $colour_names[i+1]"
    printf %s "\e[0;$((30+$i))m   "
    printf "%-11b" "colors$i"
    printf "$colur_hexes[i+1]\e[0m │\n"

    printf "%-30b" "│\e[1;$((30+$i))m ████████   $colour_names[i+1]"
    printf %s "\e[1;$((30+$i))m   "
    printf "%-11b" "colors$((i+8))"
    printf "$colur_hexes[i+9]\e[0m │\n"
    done
  printf "└────────────────────────────────────────────────────┘\n"
else
  printf "\e[1;37m     BLK        RED        GRN        YEL        BLU        MAG        CYN        WHT\n"
  printf "────────────────────────────────────────────────────────────────────────────────────────\e[0m\n"
  for i in {0..7}; printf "\e[$((30+$i))m █ $colur_hexes[i+1] \e[0m"; printf "\n"
  for i in {8..15}; printf "\e[1;$((22+$i))m █ $colur_hexes[i+1] \e[0m"; printf "\n"
fi
