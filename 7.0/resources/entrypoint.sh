#! /bin/bash

set -e

if [ -n "$SSH_PRIVATE_KEY" ]; then
	eval $(ssh-agent -s)
	ssh-add <(echo "$SSH_PRIVATE_KEY")
	unset SSH_PRIVATE_KEY
fi

exec "$@"