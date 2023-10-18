# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/asdf-vm/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## PATH
#********************************
### Local
export PATH=$HOME/.local/bin:$PATH
### Cargo
export PATH=$HOME/.cargo/bin:$PATH
### Go
#export PATH=$(go env GOBIN):$(go env GOPATH)/bin:$PATH
### .NET
export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$HOME/.dotnet:$PATH
### AWS X-Ray
export PATH=$HOME/xray-daemon:$PATH
### Homebrew
export PATH=$HOME/linuxbrew/.linuxbrew/bin/brew:$PATH

## Custom Commands
#********************************
### SSH
ssh-start() {
  eval `ssh-agent`
  ssh-add ~/.ssh/id_ed25519_sign
}

ssh-stop() {
  kill $SSH_AGENT_PID
}

## Aliases
#********************************
alias vim="nvim"
alias cat="bat --style=auto"
alias ls="exa --icons"
alias yank="xclip -sel clip"

## Environment Variables
#********************************
### System
### Development
export DOTNET_ROOT=$HOME/.dotnet
# export AWS_DEFAULT_PROFILE=Prod
# export AWS_PROFILE=Prod

# bun completions
[ -s "/home/nilton/.bun/_bun" ] && source "/home/nilton/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/nilton/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Laravel
export PATH=$HOME/.config/composer/vendor/bin:$PATH

