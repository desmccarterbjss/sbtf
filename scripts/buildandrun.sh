if [ "a${SBTF_PROJECT_FOLDER}" = "a" ]
then
	echo "[ERR] SBTF_PROJECT_FOLDER not set. Please run init.sh from the root location of this project"
	exit 1
fi

cd $SBTF_PROJECT_FOLDER

if [ ! "$?" = "0" ]
then
	echo "[ERR] Problem changing directory to SBTF_PROJECT_FOLDER (${SBTF_PROJECT_FOLDER})"
	exit 1
fi

SBTF_PROJECT_VERSION="`sed -f ${SBTF_PROJECT_FOLDER}/scripts/sedfiles/version.sed -n pom.xml 2>/dev/null`"
SBTF_ARTIFACT_ID="`sed -f ${SBTF_PROJECT_FOLDER}/scripts/sedfiles/artifactid.sed -n pom.xml 2>/dev/null`"

if [ "a${SBTF_PROJECT_VERSION}" = "a" ]
then
	echo "[ERR] Cannot find version of this application"
	exit 1
fi

if [ "a${SBTF_ARTIFACT_ID}" = "a" ]
then
	echo "[ERR] Cannot find version of this application"
	exit 1
fi

echo "[INFO] ${SBTF_ARTIFACT_ID} ${SBTF_PROJECT_VERSION}"

mvn clean package && java -jar "target/${SBTF_ARTIFACT_ID}-${SBTF_PROJECT_VERSION}.jar"
