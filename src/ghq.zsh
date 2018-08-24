#!/usr/bin/env zsh

function zaw-src-ghq() {
    # install ghq if not installed
    if ! which ghq 1>/dev/null; then
        brew install ghq
    fi

    candidates=("${(@f)$(ghq list)}")
    if which map 1>/dev/null; then # <- zsh-functional plugin is required
        # nerd fonts
        local space=$'\uf116'
        local unity=$'\ue721'
        local bitbucket=$'\uf171'
        local github=$'\uf09b'
        local ionic=$'\ue7a9'
        local intellij=$'\ue7b5'
        local print-icons() {
            local proj_path="`ghq root`/$1"
            local version=`head -n 1 $proj_path/ProjectSettings/ProjectVersion.txt 2> /dev/null | cut -d " " -f 2-2`
            if [[ $version ]]; then;
                version=$space$unity$space$version
                echo -n $version
            fi
            [[ -d $proj_path/.idea ]] && echo -n $space$intellij
        }
        cand_descriptions=("${(@f)$(ghq list | map '$1$(print-icons $1)' | map '${1:gs/bitbucket.org\//${bitbucket}${space}}' | map '${1:gs/github.com\//${github}${space}}' | map '${1:gs/git.ionicjs.com\//${ionic}${space}}')}")
    fi
    actions=(zaw-src-ghq-cd zaw-src-ghq-browse zaw-src-ghq-remove)
    act_descriptions=('cd' 'browse' 'remove')
}

function zaw-src-ghq-cd() {
    BUFFER="cd \"`ghq root`/$1\""
    zle accept-line
}

function zaw-src-ghq-browse() {
    case $1 in
        bitbucket*)
            BUFFER="open https://${1:l:gs/ /-/}"
            ;;
        github*)
            BUFFER="hub browse `echo $1 | cut -d '/' -f 2,3`"
            ;;
        git.ionicjs*)
            local ionic_path=`ghq root`/$1;
            local app_id=`cat $ionic_path/ionic.config.json | jq '.app_id' -r`
            BUFFER="open https://dashboard.ionicjs.com/app/$app_id"
            ;;
    esac
    zle accept-line
}

function zaw-src-ghq-remove() {
    echo "\033[0;33mDo you want to remove `ghq root`/$1? (y/n)"
    if read -qs && BUFFER="rm -rf `ghq root`/$1"
    zle accept-line
}

zaw-register-src -n ghq zaw-src-ghq
