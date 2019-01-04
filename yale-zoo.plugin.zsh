# Utility to operate yale cs zoo cluster easily

# Include environment variables
source ${0:A:h}/yale-zoo-config

function sshz() {
    NODE=$1
    if [[ ! $NODE ]]; then
        find_pup=$(which pup)
        if [ $? = 1 ]; then
            echo 'Please install "pup" to process the whole valid zoo list.'
            return
        fi
        curl -sSL https://zoo.cs.yale.edu/newzoo | pup 'p.caption text{}'
        return
    fi

    shift
    CMD=$@
    if [[ $CMD ]]; then
        ssh -l $ZOO_USER $NODE.zoo.cs.yale.edu $CMD
    else
        MOSH=$(which mosh)
        if [[ $? = 0 ]]; then
            mosh --ssh="ssh -l $ZOO_USER" $NODE.zoo.cs.yale.edu zsh
        else
            ssh -l $ZOO_USER -t $NODE.zoo.cs.yale.edu 'zsh -l'
        fi
    fi
}

function _sshz {
    _arguments -C \
        "1: :($(sshz | sort))"
}

compdef _sshz sshz
