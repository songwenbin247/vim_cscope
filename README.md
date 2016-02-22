# vim_cscope

Some scripts for vim and cscope. 

Features:
====================
   Creat the cscope.out database and places them on the ~/cscope/`pwd`.  
   Load "cscope add cscope.out" automatical when "vim file".

Step:
======================
  1. Install vim
  2. Install cscope
  3. cp vimrc ~/.vimrc 
  4. cp -r vim ~/.vim
  5. sudo cp cscope.sh /usr/bin/
  6. cd your C code root path
  7. cscope.sh

Well, when "vim drivers/i2c/i2c-core.c", the cscope.out add automatical. 
	
