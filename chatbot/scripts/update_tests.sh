#!/usr/bin/env bash

SCRIPT_DIR_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
BASE_DIR_PATH=$(dirname "${SCRIPT_DIR_PATH}")

APP_DIR=$(cat ${BASE_DIR_PATH}/nx.json | jq -r '.workspaceLayout.appsDir')
[[ "${APP_DIR}" == "null" ]] && APP_DIR='packages'
APP_DIR_PATH=${BASE_DIR_PATH}/${APP_DIR}

PACKAGES_DIR=$(cat ${BASE_DIR_PATH}/nx.json | jq -r '.workspaceLayout.libsDir')
[[ "${PACKAGES_DIR}" == "null" ]] && APP_DIR='packages'
PACKAGES_DIR_PATH=${BASE_DIR_PATH}/${PACKAGES_DIR}

for app_dir in $(ls -d ${APP_DIR_PATH}/*/); do
    echo Updating ${app_dir}tests/__init__.py
    [ -d "${app_dir}/tests" ] && [ -f "${app_dir}tests/__init__.py" ] && cat > ${app_dir}/tests/__init__.py <<EOL
"""unit tests."""
import os
import sys

this_file_dir_path = os.path.dirname(os.path.realpath(__file__))
monorepo_apps_path = "{}/../../".format(this_file_dir_path)
monorepo_package_path = "{}/../../../packages".format(this_file_dir_path)

def load_paths_monorepo_packages(dir_path):
    for file in os.listdir(dir_path):
        d = os.path.join(dir_path, file)
        if os.path.isdir(d):
            sys.path.append(d)

load_paths_monorepo_packages(monorepo_package_path)
load_paths_monorepo_packages(monorepo_apps_path)
EOL
done


for packages_dir in $(ls -d ${PACKAGES_DIR_PATH}/*/); do
    echo Updating ${packages_dir}tests/__init__.py
    [ -d "${packages_dir}/tests" ] && [ -f "${packages_dir}tests/__init__.py" ] && cat > ${packages_dir}/tests/__init__.py <<EOL
"""unit tests."""
import os
import sys

this_file_dir_path = os.path.dirname(os.path.realpath(__file__))
monorepo_package_path = "{}/../..".format(this_file_dir_path)

def load_paths_monorepo_packages(dir_path):
    for file in os.listdir(dir_path):
        d = os.path.join(dir_path, file)
        if os.path.isdir(d):
            sys.path.append(d)

load_paths_monorepo_packages(monorepo_package_path)
EOL
done
