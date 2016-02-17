# Source this file in your .profile to setup awssh

# Add the awssh bin to PATH
PATH=$PATH:"$(cd "`dirname ${BASH_SOURCE[0]}`" && echo $PWD)/bin"

# Setup tab completion for instances
_awssh_completion() {
  local INSTANCES="${_OPSWORKS_INSTANCES:=$(_with_awssh_credentials _awssh_list_instances)}"
  local prefix="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "$INSTANCES" -- $prefix) )
  return 0
}
complete -F _awssh_completion awssh
