Introduction
------------

This represents my current vim configuration optimized for Python/Django. It uses pathogen to bundle all the plugins in a single directory.

Usage
-----

To use the config files, simply move the whole vim-pathogen directory you got from github to your home folder and rename it to .vim.

    cd ~ && git clone git://github.com/tayfun/vim-pathogen.git .vim

Then, make sure you get the submodules which have their own repositories:

    cd ~/.vim && git submodule init && git submodule update

The last thing to do is creating a symlink for vimrc file. This way when the file is updated via git, it is instantly used:
    
    cd ~ && ln -s .vim/.vimrc

That's all! Enjoy your new vim configuration:

    gvim


Some Info
---------

I may add explanations to some of the functionality later. For the most part .vimrc file has comments for all the commands anyway. 

* One shortcut I like is F7 which is mapped to open nerdtree.

* Also, I use backupdir to have all my backup files inside one directory and not in the same directory as the file I am editing.

* I have recently started using ctrlp plugin for fuzzy searching the source
files and I must say I like it a lot. I've been using ctrlp instead of 
nerdtree increasingly. Just press Ctrl-P and fuzzy search!

Change List
-----------
v0.1: First commit. 
