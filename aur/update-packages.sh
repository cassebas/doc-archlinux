#!/bin/bash

auracle sync | awk '{print $1}' | xargs -n1 --interactive -r ./update.sh "auto"
