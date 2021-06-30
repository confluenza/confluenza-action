#!/bin/bash

TEMP_DIR=.prepare
CONFLUENZA_DIR=confluenza
CONFLUENZA_PATH="${TEMP_DIR}/${CONFLUENZA_DIR}"

rm -rf ${TEMP_DIR}
mkdir ${TEMP_DIR}

echo "- getting confluenza"
cd ${TEMP_DIR} 
git clone https://github.com/confluenza/solo-template confluenza
cd ..

echo "----------------------------------------------------------------"
echo "- copy contents to confluenza"
echo "  - copy confluenza.yml"

cp confluenza.yml ${CONFLUENZA_PATH}
 
echo "  - copy pages"

rm -rf ${CONFLUENZA_PATH}/src/pages
cp -r pages ${CONFLUENZA_PATH}/src/

echo "----------------------------------------------------------------"
echo "- yarn"
cd ${CONFLUENZA_PATH}
yarn
cd ../..

echo "----------------------------------------------------------------"
echo "- yarn build"
cd ${CONFLUENZA_PATH}
yarn build
cd ../..

echo "----------------------------------------------------------------"
echo "- Copy to public to root"
mv ${CONFLUENZA_PATH}/public public

echo "----------------------------------------------------------------"
echo "- Cleanup"
rm -rf ${TEMP_DIR}
