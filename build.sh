#! /bin/bash

set -e

dir="$(dirname "$BASH_SOURCE")"

docker build -t "vertisfinance/lualatex" ${dir}
