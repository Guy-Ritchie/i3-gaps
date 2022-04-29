sudo pacman -S vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

--# source for above command (the curl command) = 'https://github.com/junegunn/vim-plug'

sudo pacman -S ttf-iosevka-nerd --# (optional) to make sure the terminal status bar (airline - which we're about to install) has working icons..

								--# add the required github links from the vimrc file you already have..

								--# For the Coc autocompletion plugin, you need some extra packages, and need to do a few things. They are :
								--# $sudo pacman -S nodejs
								--# $sudo pacman -S npm
								--# $cd /home/<username>/.vim/plugged/coc.nvim
								--# $sudo npm install -g yarn
								--# $yarn install
								--# $yarn build


								--# A few vim Plugin Installation commands :
										Plug Commands :
											PlugInstall ==> installed all the packages defined in the vimrc file.
											PlugClean	==> cleaned/cleared/removed all the packages that have been undefined in the vimrc file.

										Coc Commands :
											CocInstall	==> installs the Coc language servers with the language autocompletion support.

											A few language servers / packages necessary for some languages :

											Python :
												$sudo pacman -S python-pip
												$pip3 install jedi --# jedi = the python language server
												Then, go to vim, and do ':CocInstall coc-python'

											C/C++ :
												$sudo pacman -S clang
												$clangd --# check if the c language server is installed and working with this command.
												Then, go to vim, and do ':CocInstall coc-clangd'

											HTML :
												Go to vim, and do ':CocInstall coc-html'

											CSS :
												Go to vim, and do ':CocInstall coc-css'

											Common Lisp :
												Go to vim, and do ':CocInstall coc-cl'

											JSON :
												Go to vim, and do ':CocInstall coc-json'

											JavaScript/TypeScript :
												Go to vim, and do ':CocInstall coc-tsserver'

											PHP :
												Go to vim, and do ':CocInstall coc-phpls'
