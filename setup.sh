#! /bin/bash

printf 'this script will install the dependencies needed to build the curriculum docs. python 3+ is required to continue.

is your virtual environment activated? [y/n] '

read is_env_activated

if [[ $is_env_activated == 'n' ]]
  then
  printf 'if you do not use a virtual environment these dependencies will be installed globally.
  this may present a conflict with other global dependencies already installed on your machine.

  are you sure you want to continue? [y/n] '
  
  read continue_without_env

  if [[ $continue_without_env == 'n' ]]
    then
    printf 'exiting. try activating your environment then re-running this script'
    exit 0
  fi
fi

printf '\n\n--------installing core dependencies--------\n\n'
pip install -r requirements.txt

printf '\n\n--------installing custom sphinx theme--------\n\n'
pip install --upgrade git+https://github.com/LaunchCodeEducation/sphinx-bootstrap-theme.git@master

printf '\n\n--------dependencies installed. you may now run the build script!--------\n\n'
