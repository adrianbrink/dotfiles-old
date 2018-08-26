# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Pyenv virtualenv
eval "$(pyenv virtualenv-init -)"

# Swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# XDG Config Home
export XDG_CONFIG_HOME="$HOME/.config"

# Sccache for compilation caching
export RUSTC_WRAPPER=sccache
