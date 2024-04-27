#!/usr/bin/bash
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# emoji favorites
#
# some do not display correctly
#
# 2023-12-04 got hexdump somewhat figured out
#-------------------------------------------------------------------------------
clear
source ~/data/global.dat
i=2
unset LC_ALL
#-------------------------------------------------------------------------------
title-80.sh -t line "Favorite EMOJI"
printf "$Wht%${i}s%s %4s %-46s %s$nrm\n" "" "CHR" "CODE" "DESCRIPTION" "HEX-DUMP"
while read lin
do
   unicode --brief $lin |              # unicode data
   while read chr uni str
   do
      cod=${uni#*+}
      str=$(echo "$str" | case.sh -t)
      case $cod in                     # display correction
         2620)chr=☠️;;
         2622)chr=☢️;;
         2623)chr=☣️;;
         26A0)chr=⚠️;;
         2744)chr=❄️;;
      esac
      case $cod in                     # column correction
         26AA | 26AB | 2757)
         printf "%${i}s%s %5s %s" "" "$chr" "$cod" ;;
         00B0 | 00B5 | 00B7 | 2024 | 2027 | 25CF)
         printf "%${i}s%2s %6s %s" "" "$chr" "$cod" ;;
         2620 | 2622 | 2623 | 26A0 | 2744 )
         printf "%${i}s%s %6s %s" "" "$chr" "$cod" ;;
         * )
         printf "%${i}s%4s %5s %s" "" "$chr" "$cod" ;;
      esac
      printf "%-46s %s\n" "$str" "$(echo -n "$chr" | hexdump -v -e '7/1 "%02X ""<"')"
   done
done < ~/data/emoji-fav.dat
#-------------------------------------------------------------------------------
