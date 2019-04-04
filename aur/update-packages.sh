#!/bin/bash

# This little simple oneliner which calls another simple script, will allow
# you to update Archlinux User Repository (AUR) packages. Probably there are
# better tools to do this but I'm already using auracle and I'm not willing
# switch. This script *is* a bit of a hack, so be warned.
#
# There are some preconditions for this to work:
#  - This script uses auracle (see https://github.com/falconindy/auracle)
#  - This script uses xargs and that means that input on stdin doesn't work, so
#    this works best if you have have either NOPASSWD in your sudo configuration
#    for your user or if you use this script with setuid set.
#
# The update.sh script that is called from here, can also work 'normally' with
# stdin input, only when the first argument is "auto" will the script update
# the package automatically.
auracle sync | awk '{print $1}' | xargs -n1 --interactive -r ./update.sh "auto"
