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
	for file in .bashrc .inputrc .profile .ruobcop.yml .vim .vimrc
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

update_submodules
symlink_files
run_vundle
