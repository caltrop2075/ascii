#!/usr/bin/bash
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# C style ASCII conversions & more
#
# searched for /printf.*"'/ & could not find anything
#
# printf "%d" "'$1" the ' only works in printf
#
source ~/data/global.dat
clear
#===============================================================================
function fx_atoi()                  # ascii     -> integer     pure bash C style
{
   printf "%d" "'$q"
}
function fx_atox()                  # ascii     -> hex
{
   printf "%x" "'$q"
}

function fx_itoa()                  # integer   -> ascii
{
#   h=$(printf "%x" "$q")           # i -> x
#   printf "\x$h"                   # x -> a
   printf "\x$(printf "%x" "$q")"   # x -> a
}
function fx_xtoa()                  # hex       -> ascii
{
   printf "\x$q"
}
#-------------------------------------------------------------------------------
function fx_xxd()                   # ascii     -> hex         hex dump
{
   echo -n "$q" | xxd -c 1 -u |
   while read -a ary                # columns -> array
   do
      echo -n ${ary[1]}             # hex column
   done
}

function fx_ord()                   # array to decode, have to use similar in awk
{
   for ((i=32;i<128;i++))
   do
      ord[i]="$(printf "\x$(printf "%x" "$i")")"
      if [[ "$q" == "${ord[i]}" ]]
      then
         printf "d:%03d x:%02x o:%03o\n" "$i" "$i" "$i"
         break
      fi
   done
}
#===============================================================================
q="A" ;printf "%s   %3s   %3d\n" "atoi" "$q" "$(fx_atoi)"
q="A" ;printf "%s   %3s   %3d\n" "atox" "$q" "$(fx_atox)"
q="65";printf "%s   %3d   %3s\n" "itoa" "$q" "$(fx_itoa)"
q="41";printf "%s   %3d   %3s\n" "xtoa" "$q" "$(fx_xtoa)"

q="A"; printf "%-2s  -> " "$q";fx_xxd  "$q";printf "x\n"
q="A"; printf "%-2s  -> " "$q";fx_ord  "$q"
#===============================================================================
