#!/bin/bash

set -e
set -o pipefail

source .github/bin/libs.sh

TEMP_DIR=.prepare
CONFLUENZA_DIR=confluenza
CONFLUENZA_PATH="${TEMP_DIR}/${CONFLUENZA_DIR}"

rm -rf ${TEMP_DIR}
mkdir ${TEMP_DIR}

printHeader "getting confluenza"
cd ${TEMP_DIR} 
git clone https://github.com/confluenza/solo-template ${CONFLUENZA_DIR} &> /dev/null
cd ..

printHeader "copy contents to confluenza"

copyMandatory "confluenza.yml"
copyMandatory "gatsby-config.js"
copyOptional "README.md"
copyOptional "CONTRIBUTING.md"

echo "  - copy pages"
rm -rf ${CONFLUENZA_PATH}/src/pages
cp -r src/pages ${CONFLUENZA_PATH}/src/

printHeader "yarn"
cd ${CONFLUENZA_PATH}
yarn
cd ../..

printHeader "yarn build"
cd ${CONFLUENZA_PATH}
[ -z "$PREFIX_PATH" ] && yarn build || yarn build:prefix-paths
cd ../..

printHeader "Copy to public to root"
mv ${CONFLUENZA_PATH}/public public

printHeader "Cleanup"
rm -rf ${TEMP_DIR}
