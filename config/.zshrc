# ── History ──────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ── Completion ────────────────────────────────────
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── Plugins ───────────────────────────────────────
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── Zoxide ───────────────────────────────────────
[[ -f ~/.zoxide-init.zsh ]] && source ~/.zoxide-init.zsh

# ── Exports ───────────────────────────────────────
export PATH=/opt/cuda/bin${PATH:+:${PATH}}
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH=/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# ── Aliases ───────────────────────────────────────
alias down="systemctl poweroff"
alias fc="cd ~/Installations/FastCat && bash fastcat.sh --shell"
alias ls="ls --color=auto"
alias ll="ls -lah --color=auto"
alias grep="grep --color=auto"

# ── Prompt ────────────────────────────────────────
eval "$(starship init zsh)"

# ── Fastfetch ─────────────────────────────────────
fastfetch
