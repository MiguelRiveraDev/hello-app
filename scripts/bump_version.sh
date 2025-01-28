#!/bin/bash
VERSION=$(cat version.txt)
IFS='.' read -r -a version_parts <<< "$VERSION"

case $1 in
  major)
    version_parts[0]=$((version_parts[0] + 1))
    version_parts[1]=0
    version_parts[2]=0
    ;;
  minor)
    version_parts[1]=$((version_parts[1] + 1))
    version_parts[2]=0
    ;;
  patch)
    version_parts[2]=$((version_parts[2] + 1))
    ;;
  *)
    echo "Usage: bump_version.sh [major|minor|patch]"
    exit 1
    ;;
esac

NEW_VERSION="${version_parts[0]}.${version_parts[1]}.${version_parts[2]}"
echo "$NEW_VERSION"
