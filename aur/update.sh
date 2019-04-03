#!/bin/bash

if [[ ($# != 1) && ($# != 2) ]]
then
    echo "Usage: $0 ['auto'] <AUR package name>"
	echo $#
	exit 1
fi

if [[ $# == 1 ]]
then
	# we're in interactive mode
	pkg=$1
	question=`echo "Update package" $pkg "(y/n)? "`
	read -p "$question" -n 1 -r answer
	echo
	if [[ $answer =~ ^[Yy]$ ]]
	then
		echo "Updating" $pkg
		auracle download $pkg
		cd $pkg && makepkg -cris && cd ..
		echo "Updated" $pkg
		echo
	else
		echo "Not updating" $pkg
		echo
	fi
else
	if [[ "$1" = "auto" ]]
	then
		# we're in automatic mode

		pkg=$2
		echo "Updating (auto mode)" $pkg
		auracle download $pkg
		cd $pkg && makepkg -cris --noconfirm && cd ..
		echo "Updated" $pkg
		echo
	fi
fi
