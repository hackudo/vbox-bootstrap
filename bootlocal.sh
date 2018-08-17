#!/bin/sh

sudo /bin/su - docker -c 'mkdir -p /home/docker/.data'
mount -t vboxsf -o umask=0022,vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` /vdata /home/docker/.data


#convenient commands I always use
cat << EOF >> /home/docker/.profile
  export EDITOR='nano'
  export LINE="------------------------------------------------------"
  export TERM=xterm-256color
  export PROMPT_COMMAND='export ERR=$?'
  export PS1="\a\n\e[1;36m$LINE\n[\w]\e[m \e[1;32m\n[\u][\A]~> \e[m"
  alias lf='ls';
  alias c='clear';
  alias l='ls -lAXpFhG --group-directories-first'
  alias rr='source ~/.profile'
  alias home="cd $HOME;l"
  alias up='cd ..;clear;lf'
  alias main'cd /var/lib/boot2docker'
  alias rem='export LAST_DIR="$PWD"; echo "Current Directory $PWD was saved" '
  alias last='cd $LAST_DIR;echo "Stored Directory $LAST_DIR reloaded"'
  alias path='echo -e ${PATH//:/\\n}'
  function ff(){ find . -type f -iname '*'"$*"'*' -ls ; }
EOF