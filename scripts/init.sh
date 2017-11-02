# AUTHOR 	: Des McCarter
# DATE		: 02/11/2017
# DESCRIPTION	: This script needs to be executed (only once) 
#		  once you have cloned the Royal Mail Test Project

function VerifyScriptLocation(){

	# Make sure we are within the root folder
	# of the test project ...

	if [ ! -d src/main/java ]
	then
		echo "[ERR] Please re-run this script from the root location of the cloned project"
		exit 1
	fi
}


# Set the scripts folder in 
# PATH in bashrc ...

function GetProjectFolderExport(){
	cat ~/.bashrc | grep "^export[ ]*SBTF_PROJECT_FOLDER" | grep "${SBTF_PROJECT_FOLDER}"
}

function GetScriptPathExport(){
	cat ~/.bashrc | grep "^export[ ]*PATH" | grep "SBTF_PROJECT_FOLDER"
}

function GetMavenLocation(){

	for maven_location in `whereis mvn | sed s/"^[^:]*:[ ]*\(.*\)$"/"\1"/g`
	do
		echo "m=${maven_location}"
	done

	exit 0

	if [ ! -d "c:\\Program Files (x86)\\Maven" ]
	then
		echo "[ERR] No maven installed."
		echo "	    1. Please create Maven folder c:\\Program Files (x86)\\Maven"
		echo "	    2. Please install Maven (in a sub folder of c:\\Progream Files (x86)\\Maven)"
		exit 1
	else
		echo "c:\\Program Files (x86)\\Maven"
	fi
}

VerifyScriptLocation

# Make sure ~/.bashrc exists ...

if [ ! -f ~/.bashrc ]
then
	> ~/.bashrc
fi

PROJECT_FOLDER_EXPORT="`GetProjectFolderExport`"
SCRIPT_PATH_EXPORT="`GetScriptPathExport`"

# Add export of SBTF_PROJECT_FOLDER
# to ~/.bashrc ...

if [ "a${PROJECT_FOLDER_EXPORT}" = "a" ]
then
	echo "export SBTF_PROJECT_FOLDER=\"`pwd`\"" >> ~/.bashrc
fi

# Add projects scripts folder to PATH
# in ~/.bashrc ...

if [ "a${SCRIPT_PATH_EXPORT}" = "a" ]
then
	echo "export PATH=\"\${PATH}:\${SBTF_PROJECT_FOLDER}/scripts\"" >> ~/.bashrc
fi

. ~/.bashrc
