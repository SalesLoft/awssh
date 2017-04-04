# Source this file in your .profile to setup awssh

# Add the awssh bin to PATH
PATH=$PATH:"$(cd "`dirname ${BASH_SOURCE[0]}`" && echo $PWD)/bin"

_CACHED_OPSWORKS_INSTANCES() {
  # Delete cache older than an hour
  find /tmp/ -name '_opsworks_instances.*'  -mtime +1h -maxdepth 1 -type f -delete
  local _CACHE_FILE="$(ls -t /tmp/_opsworks_instances.* 2> /dev/null | head -n 1)"
  if [[ -z "$_CACHE_FILE" || ! -s "$_CACHE_FILE" ]]; then
    local _CACHE_FILE="$(mktemp /tmp/_opsworks_instances.XXX)"
    awssh --list > "$_CACHE_FILE"
  fi
  cat "$_CACHE_FILE"
}

# Setup tab completion for instances
_awssh_completion() {
  local INSTANCES="$(_CACHED_OPSWORKS_INSTANCES)"
  local prefix="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "$INSTANCES" -- $prefix) )
  return 0
}
complete -F _awssh_completion awssh
