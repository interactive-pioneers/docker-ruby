#!/bin/bash

set -e

components="vim curl wget gem bundle sudo"
echo "Testing components $components..."
for component in $components
do
  if [[ -z  $(docker-compose exec web bash -lc "which $component") ]]; then
    echo "$component not found! Test failed."
    exit 1
  fi
done
echo "Test complete. All components identified."
