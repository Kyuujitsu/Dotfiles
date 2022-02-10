# Pure theme installation
fpath=( "$HOME/.zfunctions/pure" $fpath )
# completions
fpath=(/usr/local/share/zsh/site-functions $fpath)

# syntax highlighting
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U promptinit && promptinit
prompt pure

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,exports,aliases,functions,proxy}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Customize to your needs...

# @see http://vim.1045645.n5.nabble.com/MacVim-and-PATH-tt3388705.html#a3392363
# Ensure MacVim has same shell as Terminal
if [[ -a /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi

# Use Vi-mode in shell
bindkey -v

# stolen from @garybernhardt's dotfiles
# Stop wget from creating ~/.wget-hsts file. I don't care about HSTS (HTTP
# Strict Transport Security) for wget; it's not as if I'm logging into my bank
# with it.
alias wget='wget --no-hsts'

# stolen from @garybernhardt's dotfiles
# Edit an existing note
function n() {
    local note=$(find ~/notes | selecta)
    if [[ -n "$note" ]]; then
        (cd ~/notes && vi "$note")
    fi
}

# Switch projects
function p() {
  proj=$(ls ~/proj | selecta)
  if [[ -n "$proj" ]]; then
    cd ~/proj/$proj

    if [[ -d ~/secrets/$proj ]]; then
      . ~/secrets/$proj/secrets.sh
    fi
  fi
}

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
# source /usr/local/dev-env/ansible/mac_profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(dircolors ~/.dir_colors)
