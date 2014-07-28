#!/usr/bin/env bash
echo 'not implemented yet'
echo 'no te olvides de importar global_helpers'

usage(){
    echo 'help, i need somebody, help!'
}

[ "$1" = "--help" ] && usage && exit 0

_new_session_file() {
    local session_file session_example dir
    if [ -z $LOCAL_SESSION ]; then dir="$SESSIONS_DIR/globals"; else dir=$PWD; fi
    session_file="$dir/$NEW_SESSION_FILE"

    session_example=$(_echo_example_file $EXAMPLE_FILE)

    # EDITOR not explicitly set or uses vim
    if [[ -z $EDITOR || $EDITOR =~ 'vi' ]] ; then
        # create a buffer with dummy content in $TMUXSTART_DIR
        echo "$session_example" | ${EDITOR:-vi} - "+file $session_file"
    else
        echo "$session_example" > $session_file && $EDITOR $session_file
    fi
}
