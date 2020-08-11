#!/bin/bash
set -eu

xcodeproj_path=Inject.xcodeproj

if [[ -d $xcodeproj_path ]]; then
  echo "Aborting because an Xcode project already exists at ${xcodeproj_path}"
  exit 1
fi

cleanup() {
  rm -rf "${xcodeproj_path}"
}
trap cleanup EXIT

swift package generate-xcodeproj
mockingbird generate \
  --project "${xcodeproj_path}" \
  --target UseCaseInject \
  --output Tests/UseCaseInjectTests/UseCaseInject.generated.swift \
  --support MockingbirdSupport