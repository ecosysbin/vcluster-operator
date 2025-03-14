#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
    
echo $(dirname "${BASH_SOURCE[0]}")

SCRIPT_ROOT=$(dirname "${BASH_SOURCE[0]}")/..

source "${SCRIPT_ROOT}/hack/kube_codegen.sh"

THIS_PKG="ecosysbin.com/vcluster-operator"

kube::codegen::gen_helpers \
    --boilerplate "${SCRIPT_ROOT}/hack/boilerplate.go.txt" \
    "${SCRIPT_ROOT}/api"

kube::codegen::gen_client \
    --with-watch \
    --with-applyconfig \
    --output-dir "${SCRIPT_ROOT}/pkg/client" \
    --output-pkg "${THIS_PKG}/pkg/client" \
    --boilerplate "${SCRIPT_ROOT}/hack/boilerplate.go.txt" \
    "${SCRIPT_ROOT}/"