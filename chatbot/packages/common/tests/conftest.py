"""Unit tests configuration module."""

pytest_plugins = []

def load_paths_monorepo_packages():
    import os, sys
    this_file_dir_path = os.path.dirname(os.path.realpath(__file__))
    monorepo_package_path = "{}/../../".format(this_file_dir_path)
    for file in os.listdir(monorepo_package_path):
        d = os.path.join(monorepo_package_path, file)
        if os.path.isdir(d):
            sys.path.append(d)