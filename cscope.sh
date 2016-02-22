#!/bin/bash

TMPFILE=cscope.files

# Generate tag file for cscope plugin
directory=`pwd`
if [ ! -s ~/cscope ]
then
	mkdir  ~/cscope 
fi
cscope=${directory/\//$HOME\/cscope/} && echo $cscope
if [ -s $cscope ]
then
	rm -r $cscope
fi
mkdir -p $cscope
find $directory  -name "*.[chsS]" -print > $TMPFILE
cscope -kbq -i $TMPFILE
mv cscope* $cscope
rm -f $TMPFILE
