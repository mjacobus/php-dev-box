
function inform() {
  # echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $@"
  echo "#############################################################################"
  # echo -e "\033[0m"
}

function install() {
  inform "installing '$@'"
  DEBIAN_FRONTEND=noninteractive sudo apt-get install -y "$@"

  if (($? != 0)); then
    inform "Failed installing $@"
    exit $?
  fi
}

function include_or_exit_on_failure() {
  source $1 | exit 1
}

function exit_on_failure() {
  if (($1 != 0)); then

    if (($# > 1)); then
      inform $2
    else
      inform "Failed"
    fi

    exit $1
  fi
}

function template() {
  inform "Coping template $1"
  echo $PWD
  sudo cp -rfp  templates$1 $1

  exit_on_failure $?
}

function backup() {
  local file=$1
  local backup=$file.bkp

  if [ ! -f $backup ]; then
    sudo cp -rfp $file $backup
    exit_on_failure $?
  fi
}

function restart_service() {
  sudo service $1 restart
  exit_on_failure $? "unable to restart service $1"
}

function run_or_fail() {
  local command="$@"
  $($command)
  exit_on_failure $? "Command '$command' failed"
}

function append_if_not_exists() {
  local content=$1
  local file=$2

  if !  grep -Fqs "$content" "$file" ; then
     printf "%s\n" "$content" >> "$file"
  fi
}

function as_vagrant_append_if_not_exists() {
  local content=$1
  local file=$2

  if ! grep -Fqs "$content" "$file" ; then
    as_vagrant "printf \"%s\n\" '$content' >> '$file'"
  fi
}

function as_vagrant() {
  local command="$@"
  # sudo -H -s -u vagrant bash -c "$command"
  sudo su vagrant --login -c "$command"
}

function as_vagrant_check() {
  local command="$2 > /dev/null 2>&1"
  as_vagrant $command

  if (( $? == 0 )); then
    echo "OK: $1"
  else
    echo "FAILED (code: $?): $1"
  fi
}

has() {
  type "$1" > /dev/null 2>&1
  return $?
}
