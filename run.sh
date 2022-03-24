#!/bin/env bash
set -uoe pipefail

command -v cue > /dev/null || (echo "Installing cue"; set -x go install cuelang.org/go/cmd/cue@latest)

set -x
cue vet cosign_verify_policy.cue cosign-verify-f4f0c6c4cf0aadd55216.yaml
