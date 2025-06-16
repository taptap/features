#!/bin/bash

set -e

source dev-container-features-test-lib

# Debian-specific tests
check "debian-git-version" bash -c "git --version | grep -E 'git version [0-9]+\.[0-9]+'"

# Run common tests
source "$(dirname "$0")/test.sh"