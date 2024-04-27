#!/usr/bin/awk -f
#------------------------------------------------------------------------------#
#                            Programmed By Liz                                 #
#------------------------------------------------------------------------------#
# ascii table
#===============================================================================
BEGIN {
   system("clear")
   system("title-80.sh -t line \"ASCII Table\"")
   print "\\nnn       octal"
   print "\\xhh       hex"
   print "\\uhhhh     unicode 4"
   print "\\Uhhhhhhhh unicode 8"

   print "\ndec:hx:oct chr\n"
   print "007:07:007 BEL \\a not always recognized"
   print "008:08:010 BS  \\b"
   print "009:09:011 HT  \\t"
   print "010:0A:012 LF  \\n typically CR LF pair, DOS & Windows"
   print "011:0B:013 VT  \\v"
   print "012:0C:014 FF  \\f"
   print "013:0D:015 CR  \\r remove DOS/Win -> Linux"
   print "027:1B:033 ESC \\e"

   for(n=32;n<128;n++)
   {
      if(n%8==0)
         printf("\n")
      printf("%03d:%02X:%03o %c  ",n,n,n,n)
   }
   printf("\n")
}
#===============================================================================
