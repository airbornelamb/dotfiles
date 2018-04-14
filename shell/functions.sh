
# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Create a directory and cd into it
mcd() {
    mkdir --parents --verbose "${1}" && cd "${1}"
}

gitfire() {
  git add -A && git commit -m 'FIRE FIRE FIRE' && git push origin fire-branch
}

# Copy ssh key to server
# type "copykey user@server"
copykey() {
  [ -z "$1" ] && echo 'Usage: copykey user@server' && return 1
  ssh $1 'mkdir -p .ssh && cat >> .ssh/authorized_keys' < ~/.ssh/id_rsa.pub
}

sshpermissions() {
  echo 'Setting permissions for ssh folder and keys'
  chmod 700 ~/.ssh && chmod 600 ~/.ssh/*
}

synctunnel() {
	[ -z "$1" ] && echo 'Enter synctunnel HOSTNAME/IP to bind remote syncthing to local 9999 port' && return 1
	ssh -L 9999:localhost:8384 $1
}

portcheck() {
	[ -z "$1" ] && echo 'Enter "portcheck PORTNUM" to see if it is accessible from the internet' && return 1
	curl ifconfig.co/port/$1
}
alias checkport=portcheck

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xpvf $1  ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# cli-notes

export NOTESDIR="$HOME/Sync/notes"

nn() {
  local note_name="$*"
  local note_date="`date +%F`"
  local note_ext="md"  
  if [[ $note_name == "" ]]
  then
    note_name="$note_date.$note_ext"
  fi
  mkdir -p $NOTESDIR
  vim -c 'startinsert' "$NOTESDIR/$note_name"
}

ns() {
  local file
  [ -z "$1" ] && echo "No argument supplied - Enter a term to search" && return 1
  file="$(rg --files-with-matches --no-ignore --ignore-case --hidden --no-heading --no-messages $1 $NOTESDIR | fzf --preview "head -100 {}")"
  if [[ -n $file ]]
  then
    vim $file
  fi
}

nl() {
  local files
  files="$(rg --files $NOTESDIR | fzf --preview "head -100 {}")"
  if [[ -n $files ]]; then
    vim $files
  fi
}

zoteroinstall() {
  wget https://raw.github.com/smathot/zotero_installer/master/zotero_installer.sh -O /tmp/zot
  tail -n +2 /tmp/zot > /tmp/zotero_installer.sh
  chmod +x /tmp/zotero_installer.sh
  /tmp/zotero_installer.sh
}


symlink() {
  [ -z "$1" ] && echo "No argument supplied - Enter path for Original file and New file" && return 1
  ln -sf $1 $2
}

mountmac() {
  local macuser="josh"
  local macpass="changeme"
  local macip="192.168.56.101"
  local macshare="Downloads"
  local mntpoint="/mnt/mac"
  if [ ! -d $mntpoint ] ; then
    sudo mkdir -p $mntpoint
    sudo chown -R $USER $mntpoint
  fi
  sudo mount -t cifs //$macip/$macshare $mntpoint -o username=$macuser,password=$macpass,nounix,sec=ntlmssp,rw,iocharset=utf8,file_mode=0777,dir_mode=0777
  cd $mntpoint
}

mountiso() {
  [ -z "$1" ] && echo "Please specify an ISO file to mount" && return 1
  mkdir -p /tmp/iso
  sudo mount -o loop $1 /tmp/iso
  cd /tmp/iso
}

