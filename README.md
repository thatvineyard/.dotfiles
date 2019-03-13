# .dotfiles
A collection of all my dotfiles

 - .bashrc
 - .zshrc
 - .emacs.d

## Topfiles
By placing these configuration files in an unexpected folder the system will not know where to look to include them. Therefore you need what I call a "topfile", which sits in your home directory and correctly includes the dotfiles in their new home. These can be used by either copying or creating a symbolic link.