#!/bin/zsh
tar c -C${HOME} .zshrc .zfunc .oh-my-zsh | ssh $1 'tar mx -C${HOME}' 
ssh -t $1 "/bin/zsh"
