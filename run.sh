#!/bin/bash

# jt "$@" # looks like garbage
jupyter notebook --port=1337 --ip=0.0.0.0 --allow-root --notebook-dir=/notebooks --no-browser --NotebookApp.token="$1"