#!/bin/sh
#
#
# shell script to run latex over the single top d0 note files
#
# 
# Author: Reinhard Schwienhorst
#
# Modifications: 2/4/2004, RS: adjust so that it works on clued0 and
#                              on non-fnal machines.
#
#
##################################################################
# initial setup. 
#echo "texmf is $TEXMF"
# check if tex has been set up on clued0. If not, do it here.
echo $HOST |grep "clued0"
if [ "$?" -eq 0 ]
then
  echo "Running on clued0."
  # also set up revtex
  if [ "a$REVTEX_DIR" == "a" ] 
  then
    # make sure we can set up ups products:
    . /D0/ups/etc/setups.sh
    echo "Setting up revtex"
    //setup revtex
  fi
  # set up the TEXINPUTS path so that any subdirectories are included.
  export TEXINPUTS=".//:$TEXINPUTS:"
else
  # we are not on clued0.
  # tex and revtex is already set up.

  # set up the TEXINPUTS path so that any subdirectories are included.
  echo "setting up non-clued0 texinputs."
  mydir=`pwd`
  export TEXINPUTS=".//:"

  # end of checking if we are on clued0
fi
#######################################################################

#
#

# now run the program
latex me_note.tex
