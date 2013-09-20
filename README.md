VIM custom files setup instructions
===================================

In order to set up your vim:

* Go to your home directory

``` bash
	cd ~/
```

* Clone the repository in your home directory 

```bash
	git clone https://github.com/farhanrahman/customvim.git
```

* If you have your .vim file in your home directory make a backup of it

```bash
	mv .vim .vim_backup
```

* Delete the .vim directory (maybe you can find a better way to move the vim files in customvim directory to .vim directory) and then rename customvim to .vim

```bash
	mv customvim .vim
```

* Go inside the .vim directory and update the submodules:

```bash
	cd .vim
	git submodule sync
	git submodule update --init --recursive
```

* You are ready to use your customised vim. Files taken mostly form jkimbo's vimfiles repository:

https://github.com/jkimbo/vimfiles


* If you can't get the submodules then the best thing is to look at .gitmodules and see what they are stored as in the bundles folder. Then download the latest releases from the git repo of those bundles and unzip them into the bundle folder in your ~/.vim/ directory. That should work. There are some bugs in MiniBuf that I found but there is a trick to solve that (just a few clicks of buttons). Message me if you require assitance in there.
