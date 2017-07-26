#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

usage() {
cat << EOF
Helpers for working with in-cluster tiller.

Available Commands:
  destroy       Delete draftd from cluster

EOF
}

destroy() {
  helm delete draftd --purge
}

cmd="${1:-}"
(( "$#" > 0 )) && shift;

case "${cmd}" in
  destroy)
    destroy
    ;;
  help|--help|-h)
    usage
    ;;
  *)
    usage
    exit 1
    ;;
esac
