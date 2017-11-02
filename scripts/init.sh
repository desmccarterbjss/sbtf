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

	unset MAVEN_LOCATION

	for maven_location in `whereis mvn | sed s/"^[^:]*:[ ]*\(.*\)$"/"\1"/g`
	do
		if [ ! "a`echo ${maven_location} | sed -n s/'^\(.*mvn\)$'/'\1'/p`" = "a" ]
		then
			if [ ! "a`${maven_location} -version |  grep 'Apache Maven'`" = "a" ]
			then
				MAVEN_LOCATION="${maven_location}"
				break;
			fi
		fi
	done

	if [ "a${MAVEN_LOCATION}" = "a" ]
	then
		echo "[ERR] No maven installed."
		echo "Please install (and set-up) Maven"
		exit 1
	else
		echo "[INFO] Maven installation found: ${MAVEN_LOCATION}"
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

# Check that we have Maven installed ...
GetMavenLocation
