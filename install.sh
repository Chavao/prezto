if [ -e ~/.zprezto ]
then
  mv -f ~/.zprezto ~/.zprezto-before-chavao-prezto
fi

if [ -e ~/.zshrc ]
then
  mv -f ~/.zshrc ~/.zshrc-before-chavao-prezto
fi

git clone https://github.com/Chavao/prezto ~/.zprezto

cd ~/.zprezto

git submodule update --init --recursive

cd $HOME

ln -sf ~/.zprezto/runcoms/zlogin .zlogin
ln -sf ~/.zprezto/runcoms/zlogout .zlogout
ln -sf ~/.zprezto/runcoms/zpreztorc .zpreztorc
ln -sf ~/.zprezto/runcoms/zprofile .zprofile
ln -sf ~/.zprezto/runcoms/zshenv .zshenv

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

touch ~/.zshrc

cat >> ~/.zshrc << EOF
# Load zshrc
source $HOME/.zprezto/runcoms/zshrc

# Load zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Customize to your needs...
EOF

