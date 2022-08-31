#!/usr/bin/env bash
MYDIR=`cd $(dirname $0); pwd`

update_submodules() {
	echo "Updating submodules in ${MYDIR}"
	pushd "$MYDIR"
	git submodule update --init
	popd
}

symlink_files() {
	echo "Setting up dotfiles from ${MYDIR}"
	for file in .bashrc .inputrc .profile .rubocop.yml .vim .vimrc
	do
		ln -nsf "${MYDIR}/${file}" ~
	done

	mkdir -p ${HOME}/bin
	for file in ${MYDIR}/bin/*
	do
		ln -nsf ${file} ~/bin
	done
}

run_vundle() {
	vim -u ~/.vim/bundles.vim +BundleInstall +qall
}

configure_git() {
  echo "Configuring git"
	ln -nsf "${MYDIR}/gitignore" ~/.gitignore
	[ -e ~/.gitconfig ] || cp "${MYDIR}/.gitconfig" ~
}

configure_plover() {
  # TODO: add support for Linux
  if [ `uname -s` = "Darwin" ]
  then
    plover_bin='/Applications/Plover.app/Contents/MacOS/Plover'
    plover_files="${HOME}/Library/Application Support/plover"
    if [ ! -e "${plover_bin}" ]
    then
      echo "Plover installation not detected"
      return 1
    fi
    if [ -z "`which plover`" ]
    then
        echo "Setting up plover wrapper"
        (echo "#!/bin/sh"; echo "exec '${plover_bin}' \"\$@\"") >~/bin/plover
        chmod +x ~/bin/plover
    fi

    echo "Symlinking plover config files"
    mkdir -p "${plover_files}"
    ln -nsfv ${MYDIR}/plover/* "${plover_files}"
  fi
}

update_submodules
symlink_files
configure_git
run_vundle
configure_plover
