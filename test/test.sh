#!/bin/bash

set -e

# Universal tests
function test {

  version=$1
  container=$2

  printf "\nTesting version $version\n "

  printf "\nChecking dependencies...\n"
  for dependency in "${dependencies[@]}"
  do
    docker-compose run $container bash -lc "which $dependency" || (printf "\n$dependency not found! Test failed.\n"; exit 1)
  done

  printf "\nChecking Ruby...\n"
  docker-compose run $container bash -lc "rvm use $version" || (printf "\nRuby $version not found! Test failed.\n"; exit 1)

  printf "\nChecking user...\n"
  docker-compose run $container bash -lc 'test "$(whoami)" = "deploy"' \
    && printf "User 'deploy' located.\n" \
    || (printf "\nUser not found! Test failed.\n"; exit 1)

  printf "\n$version test complete. All tests successful.\n"
}

declare -a dependencies=(wget rvm)

test 2.1.5 docker-ruby-215
test 2.1.6 docker-ruby-216
test 2.2.2 docker-ruby-222
test 2.2.3 docker-ruby-223
test 2.2.4 docker-ruby-224
