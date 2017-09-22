#!/bin/sh

SHPATH="$( cd "$(dirname "$0")" ; pwd -P )"
alias hurl="\curl --http1.1 -A "shtut" -f#LO"

if [ "$1" == "setup" ]; then
	printf "\nSetup\n\n"
	printf "Downloading...\n"
	if [ $? != "0" ]; then
		printf "Unable to create $SHPATH/core\nEnsure that $0 can write in this directory.\n\n"
		exit 1
	fi
	exit 0
fi

if [ ! -d "$SHPATH/core" ]; then
	printf "\nCore files are missing for $0.\nPlease run \'$0 setup\'\n"
	exit 1
fi

function StartUp {
	for file in $SHPATH/core/*; do
		printf "Loading $file..."
		source $file
		if [ "$?" != "0" ]; then
			printf "Failed\n"
			printf "Please check your installation of $0\n"
			exit 1
		fi
		printf "Success!\n"
	done
}
StartUp
dgTest
Main $1
