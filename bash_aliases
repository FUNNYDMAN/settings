alias py3=python3
# low-level stuff and C related
alias objdump='objdump -Mintel'
alias gdb='gdb -q'
alias nasm='nasm -w+all'
alias gcc='gcc -Wall'

# display hexdump in canonical form
alias hd='hexdump -C'

# daily routine
alias lh='ls -lah'
alias ff='find . -name $1'
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'
alias untar='tar -zxvf '
alias sshadd='eval `ssh-agent -s`; ssh-add '
# show file permissions as octal number
alias sco='stat -c "%a %n"'
# copy to clickboard from terminal
alias xsel='xsel -b'
alias apti='sudo apt-get install -y'
alias agu='sudo apt-get update'
alias c='clear'
alias e='exit'
# when I make typos it can be handy | don't judge me)
alias ды='ls'
alias св='cd'

# tree aliaces
alias tree='tree --dirsfirst'

# git aliases
alias gtree='git log --graph --full-history --all --color --pretty=format:"%x1b[33m%h%x09%x09%x1b[32m%d%x1b[0m %x1b[34m%an%x1b[0m   %s" "$@"'

# docker stuff
__dcub() {
    docker-compose build --no-cache $@
}
alias dcub=__dcub
alias dcu='docker-compose up'
#alias dcub='docker-compose up --build'
alias dcubn='docker-compose build --no-cache; docker-compose up' 
# Delete all containers
alias drm='docker rm $(docker ps -a -q)'
# Delete all images
alias drmi='docker rmi $(docker images -q)'
alias dm='docker-machine'
# redis stuff
alias redc='redis-cli'

__export_vars() {
    source "$1"
    export $(cut -d= -f1 "$1")
}

alias source_file=__export_vars

# ssh 
__add_ssh_key() {
if [[ -n "$1" ]] && [[ -f ~/.ssh/$1 ]];  then
    eval `ssh-agent -s`>/dev/null 2>&1
    ssh-add ~/.ssh/$1>/dev/null 2>&1
    echo "ssh key $1 was added"
else
    echo "No such key file"
fi
}
alias essh=__add_ssh_key

__add_permanently_ssh_key() {
if [[ -n "$1" ]] && [[ -f ~/.ssh/$1 ]];  then
    res=$(realpath .)
    if [[ -d $res/.git ]]; then
        git config core.sshCommand "ssh -i ~/.ssh/$1"
        echo "Key was added"
    else
        echo "Not in git repository"
    fi
    else
        echo "Not such file"
fi
}
alias pssh=__add_permanently_ssh_key
# network stuff
alias netap='sudo netstat -ap'
alias myip="curl http://ipecho.net/plain; echo"

# changing directories
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'

# django stuff
alias prun="python manage.py runserver 0.0.0.0:8000"
alias psu="python manage.py createsuperuser"
alias pmig="python manage.py migrate"
alias pmake="python manage.py makemigrations"
alias pshell='python manage.py shell_plus --print-sql'
alias ptest='python manage.py test'
alias pipi='pip install -r requirements.txt'
alias svenv='source venv/bin/activate'
alias penv='pipenv'
alias lzd='lazydocker'

# https://github.com/python-poetry/poetry/issues/536#issuecomment-498308796
alias poetry="python3 $HOME/.poetry/bin/poetry"



alias vimconf="nvim ~/.config/nvim/init.vim"
alias speed="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
