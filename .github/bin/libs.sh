#!/bin/bash

function printHeader()
{
  echo "----------------------------------------------------------------"
  echo "- $1"
}

function copyMandatory()
{
  if test -f $1; then
    echo "  - copy $1"
    cp $1 ${CONFLUENZA_PATH}
  else
    echo "  - Abort: $1 does not exist"
    exit 1
  fi
}

function copyOptional()
{
  if test -f $1; then
    echo "  - copy $1"
    cp $1 ${CONFLUENZA_PATH}
  else
    echo "  - skipping $1, does not exist"
  fi
}

