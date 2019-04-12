#!/usr/bin/env python

import subprocess

print('Welcome to the automatic AUR package update script.\n')
print('This script will run auracle to find package that need ')
print('an update and will allow update them one by one.\n')

sync = subprocess.run(['auracle', 'sync'], capture_output=True, text=True)

lines = sync.stdout.rstrip().split('\n')

pkg_cnt = 0
for pkg in lines:
    # These are the packages to update according to auracle sync
    pkg_name = pkg.split(' ')[0]
    if pkg_name != "":
        pkg_cnt += 1
        print('Found package {}.'.format(pkg_name))
        # Run the update script for this package.
        subprocess.run(['./update.sh', pkg_name])

if pkg_cnt == 0:
    print('Did not find any packages to update.')
