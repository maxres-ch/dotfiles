export DOTENV=full
export HOMEBREW_NO_AUTO_UPDATE=1
eval "$(starship init zsh)"
# export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rye/shims:$HOME/.krew/bin:$(go env GOPATH)/bin:$HOME/.rd/bin:$HOME/go/bin:/usr/local/go/bin:$HOME:$PATH"
export GPG_TTY=$(tty)
source ~/.fzf-tab/fzf-tab.plugin.zsh
# 
# # AWS setup 
complete -C '/usr/local/bin/aws_completer' aws
# 
# # PRR
# 
review () {
    # review repo 44 view
    repo=$1
    shift
    pr_num=$1
    shift
    action=$1
    shift
    echo ${@}
    echo "gh pr -R $ORG/$repo $action ${@} $pr_num"
    gh pr -R $ORG/$repo $action ${@} $pr_num
}

# source ~/.fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
# key bindings                         
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh 
bindkey "^C" fzf-cd-widget
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion

PROJECT_HOME=${PROJECT_OPEN_HOME:-$HOME/projects}
projectEditorOpen() {
    vimargs=""
    pushd ~/projects > /dev/null
    selected="$(fd | fzf)" 
    if [ -f $selected ]; 
    then 
        vimargs=$(basename $selected);
        pushd $selected(:h) > /dev/null;
    else
        pushd $selected > /dev/null; 
    fi
    zle reset-prompt
    $EDITOR $vimargs < /dev/tty
}

cdProjectDir() {
    pushd ~/projects > /dev/null
    selected="$(fd --type d | fzf)" 
    pushd $selected
    zle reset-prompt
}

zle -N projectEditorOpen_widget projectEditorOpen
zle -N cdProjecDir_widget cdProjectDir
bindkey '^p' projectEditorOpen_widget
bindkey '^o' cdProjecDir_widget

# # Kubectl                                                                                                                                
command -v fzf >/dev/null 2>&1 && {                                                                                                        
        source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n 1 | fzf  --multi=0 #g')  
}                                                                                                                                          
alias k=kubectl                                                                                                                            
alias kgp="kubectl get po"                                                                                                                 
alias kl="kubectl logs"                                                                                                                    
# complete -F __start_kubectl k kgp kl                                                                                                       


rprompt() {
    echo "removing prompt from clipboard"
    pbpaste | sed '/⛵/d' | pbcopy
}
kg() {
    kubectl get $* -o name | \
        fzf --preview 'kubectl get {} -o yaml' \
            --bind "ctrl-\:execute(kubectl get {+} -o yaml | bat -l yaml )" \
            --bind "ctrl-r:reload(kubectl get $* -o name)" --header 'Press CTRL-R to reload' \
            --bind "ctrl-]:execute(kubectl edit {+})";
}

kallimages () {
    shift
    k get po ${@} -A -o jsonpath='{.items[*].spec.containers[*].image}' | tr -s '[[:space:]]' '\n' | sort | uniq -c
}
# git
alias gco="git checkout"
# 
# 
alias j=jira
# 
function jn() {
    jira $1 "CCSJP-${2}"
}

function jurl() {
    echo -n "https://cambiahealth.atlassian.net/browse/${1}" | pbcopy


}
function mdto() {
    pandoc ${1} --to ~/projects/leadtools/jira.lua -o -
}
function chg_theme () {
    sed -i "" -e "s#^colors: \*.*#colors: *gruv_${1}#g" ~/.alacritty.yml
}
# 
function gcnb () {
    jira_num=$1
    shift
    slug_title=$(sluffy "$(jira view $jira_num --gjq='fields.summary')")
    (( $# >= 1 )) && { post_title=$(sluffy "$@") && slug_title="${post_title}"; echo $slug_title; }
    git checkout -b "${jira_num}-${slug_title}"
}
gb () (
    git branch --show-current
)
gpb () {
    branch=$(gb)
    if [[ $branch == "main" || $branch == "master" ]];
    then
        echo "not pusing $branch"
        return 1
    fi
    git push origin $(gb)
}

gup () {
    if git checkout main;
    then
        git pull origin main;
    elif git checkout master;
    then
        git pull origin master;
    fi
}

gcm () {
    message=$1
    shift
    git commit -m $1 $@

}

# docker


drun () {                                                          
    local container="${1}"
    docker pull "${container}"                                     
    docker run --entrypoint '' -it --rm "${container}" sh
}                                                                  
drrun () {                                                           
    local container="${1}"                                          
    docker pull "${container}"                                      
    docker run --entrypoint '' --user 0:0 -it --rm "${container}" sh           
}                                                                   

close_all_prs () {
    for i in $(gh pr list --repo ${1} --json url | jq -r '.[].url'); do gh pr close $i; done
}


cleanns() {
    kubectl get ns $1 -o json | jq '.spec.finalizers = []' | kubectl replace --raw "/api/v1/namespaces/$1/finalize" -f -
}
