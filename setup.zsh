# Source this file in your .profile to setup awssh

# Add the awssh bin to PATH
PATH=$PATH:"$(cd "`dirname ${(%):-%N}`" && echo $PWD)/bin"

# Setup tab completion for instances
_awssh_completion() {
  local INSTANCES="${_OPSWORKS_INSTANCES:=$(awssh --list)}"
  local prefix="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "$INSTANCES" -- $prefix) )
  return 0
}

autoload bashcompinit
bashcompinit

complete -F _awssh_completion awssh
