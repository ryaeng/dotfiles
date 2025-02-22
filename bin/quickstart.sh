#/bin/bash

cd ~ && mkdir repos && cd repos
git clone https://github.com/ryaeng/dotfiles.git dotfiles

brew install bash
brew install bat
brew install fd
brew install fish
brew install fzf
brew install gh
brew install git
brew install git-delta
brew install lazydocker
brew install lazygit
brew install lf
brew install lsd
brew install mackup
brew install neofetch
brew install neovim
brew install pgcli
brew install ripgrep
brew install starship
brew install tealdeer
brew install tmux
brew install wakatime-cli
brew install zoxide

brew tap clementtsang/bottom
brew install bottom
brew tap federico-terzi/espanso
brew install espanso

if [[ `uname` == 'Darwin' ]]; then
   brew install trash-cli
   brew install koekeishiya/formulae/skhd
   brew services start skhd
   brew install koekeishiya/formulae/yabai 
   brew services start yabai
fi

# mackup
cp ~/repos/dotfiles/mackup/.mackup.cfg ~/.mackup.cfg
mackup restore

# fisher https://github.com/jorgebucaran/fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install FabioAntunes/fish-nvm edc/bass franciscolourenco/done

# nvm https://github.com/nvm-sh/nvm
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install 'lts/*'

# vimplug https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall

# tpm https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# casks
if [[ `uname` == 'Darwin' ]]; then
   brew tap epk/epk
   brew install --cask font-sf-mono-nerd-font
   brew install --cask alacritty
   brew install --cask alfred           
   brew install --cask fantastical      
   brew install --cask obsidian         
   brew install --cask postman          
   brew install --cask spacelauncher    
   brew install --cask vivaldi
fi
