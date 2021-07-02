#!/bin/bash

TEMP_DIR=.prepare
CONFLUENZA_DIR=confluenza
CONFLUENZA_PATH="${TEMP_DIR}/${CONFLUENZA_DIR}"

rm -rf ${TEMP_DIR}
mkdir ${TEMP_DIR}

echo "- getting confluenza"
cd ${TEMP_DIR} 
git clone https://github.com/confluenza/solo-template ${CONFLUENZA_DIR}
cd ..

echo "----------------------------------------------------------------"
echo "- copy contents to confluenza"
echo "  - copy confluenza.yml"
cp confluenza.yml ${CONFLUENZA_PATH}

echo "  - copy gatsby-config.js"
cp gatsby-config.js ${CONFLUENZA_PATH}
 
echo "  - copy pages"
rm -rf ${CONFLUENZA_PATH}/src/pages
cp -r src/pages ${CONFLUENZA_PATH}/src/

echo "  - copy README.md"
cp README.md ${CONFLUENZA_PATH}

echo "----------------------------------------------------------------"
echo "- yarn"
cd ${CONFLUENZA_PATH}
yarn
cd ../..

echo "----------------------------------------------------------------"
echo "- yarn build"
cd ${CONFLUENZA_PATH}
[ -z "$PREFIX_PATH" ] && yarn build || yarn build:prefix-paths
cd ../..

echo "----------------------------------------------------------------"
echo "- Copy to public to root"
mv ${CONFLUENZA_PATH}/public public

echo "----------------------------------------------------------------"
echo "- Cleanup"
rm -rf ${TEMP_DIR}
