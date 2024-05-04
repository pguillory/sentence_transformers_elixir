#!/bin/sh
set -euo pipefail
cd "$(dirname $0)"

function rm_venv {
  rm -rf venv
}

python3 -m venv venv
trap rm_venv EXIT
source venv/bin/activate
pip3 install -r requirements.txt
trap - EXIT
