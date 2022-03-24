#!/bin/env bash
set -uoe pipefail

command -v cue > /dev/null || (echo "Installing cue"; set -x go install cuelang.org/go/cmd/cue@latest)

set -x
go mod init github.com/zregvart/taskrun-policy-cue
go mod edit -replace=k8s.io/client-go=k8s.io/client-go@v0.22.5
go mod edit -replace=k8s.io/apimachinery=k8s.io/apimachinery@v0.22.5
cue mod init
go get k8s.io/api k8s.io/apimachinery github.com/tektoncd/pipeline
cue get go github.com/tektoncd/pipeline/pkg/apis/pipeline/
