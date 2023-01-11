#!/bin/bash

# OfteN[cp] (14/12/2004): This batch maintains server running in case of crash and handles server
# restart exit codes, relaunching.
# 
# Pulseczar (2014): Ported to Bash.
#
# To start the server, provide a configuration option. For example: ./runShakaCuTF.sh public

SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"

PUBLIC_SERVER_PORT_ADDRESS=27500
TEST_SERVER_PORT_ADDRESS=27501
TEST_SERVER_PASSWORD=asdf

MASTER_SERVER_ADDRESSES="qwmaster.ocrana.de:27000 master.quakeservers.net:27000 qwmaster.fodquake.net:27000"

while true
do

	echo "Launching Shaka's CustomTF 2009 with PQWSV... (permanent batch loop)"

	# Runs the stable server code base, open to the public. (Pings master servers to inform the public.)
	if [ "$1" == "public" ]; then
		echo -e "Running the public server, on port $PUBLIC_SERVER_PORT_ADDRESS. Server will report to master servers.\n"
		./mvdsv +gamedir fortress -port $PUBLIC_SERVER_PORT_ADDRESS +pausable 0 +exec cpserver_shaka.cfg \
		        +setmaster $MASTER_SERVER_ADDRESSES

	# Use the following for a server that is to be used only for development, that will run on a different port.
	elif [ "$1" == "test" ]; then
		echo -e "Running the test server, on port $TEST_SERVER_PORT_ADDRESS. Will not report to master servers.\n"
		./mvdsv +gamedir fortress -port $TEST_SERVER_PORT_ADDRESS +pausable 1 +password $TEST_SERVER_PASSWORD \
		        +exec cpserver_shaka.cfg

	# For the time being, the user must enter a configuration to use to start the server.
	else
		echo -e "Choose a configuration (see $SCRIPT_NAME).\n"
	fi

	# [Determine whether to automatically restart the server, if it shuts down or crashes.]
	exitCode=$?
	# When the server exits with the code, 2, it's asking to be restarted.
	if [ $exitCode -eq 2 ]; then
		echo "Restarting server... (Shell batch)"
	# It returns 1 when an error occurs.
	elif [ $exitCode -eq 1 ]; then
		echo "Server crashed?! Restarting... (Shell batch)"
	# It returns 0 on normal exit (with no error).
	else
		# Don't restart the server. Allow it to exit. And exit this script.
		break
	fi

done
