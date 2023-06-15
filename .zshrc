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

# Local and Cargo paths
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH

# Go paths
export PATH=$(go env GOBIN):$(go env GOPATH)/bin:$PATH

# Dotnet paths (through asdf)
export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR=$(echo $HOME/.asdf/shims/dotnet)
export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_VER=(echo $($DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR --version))
export DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=$(echo $HOME/.asdf/shims/dotnet)

alias vim="lvim"
alias bat="bat --style=auto"

alias ls="exa --icons"

