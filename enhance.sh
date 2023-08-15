set -xe
VERSION=$1
UPDATE=${2:-0}
MINOR=${3:-4.4}

if [ -z "$VERSION" ]; then
   echo "No version set"
   exit 1
fi

git -c advice.detachedHead=false checkout $VERSION
git cherry-pick ${MINOR}..${MINOR}_crac
PROFILES="-PSQL-templates -PMSSQL-2019-latest -PDB2-11.5 -POracle-21"
mvn versions:set -DnewVersion=${VERSION}.CRAC.${UPDATE} -DgenerateBackupPoms=false $PROFILES
mvn versions:set-property -Dproperty=stack.version -DnewVersion=$VERSION -DgenerateBackupPoms=false $PROFILES
git commit -a -m "CRaC-enhanced release ${VERSION}.CRAC.${UPDATE}"
git tag ${VERSION}.CRAC.${UPDATE}
set +x
echo "Now type:"
echo -e "\tgit push crac ${VERSION}.CRAC.${UPDATE}"
