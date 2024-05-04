#!/bin/sh
set -euo pipefail
cd "$(dirname $0)"

source venv/bin/activate
exec python run.py
