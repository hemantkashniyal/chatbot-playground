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
