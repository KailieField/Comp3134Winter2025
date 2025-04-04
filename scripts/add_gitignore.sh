#!/bin/bash

echo "------------------------------------------------------------------------------"
echo "SCRIPT NAME: add_gitignore.sh"
echo "AUTHOR: Kailie Field"
echo "CREATED: 2025-04-04"
echo "------------------------------------------------------------------------------"
#--------------------------------[ PURPOSE ]----------------------------------------
# [1] ---- Automatically adds a `.gitignore` file inside each 'wk*' folder if
#          !Exists
# [2] ---- Ensures each wkX folder is properly tracked by GitHub without revealing
#	       internal strucgtures like lab folders prematurely
# [3] ---- Supports cybersecurity best practices by controlling visibility and
#          reducing accidental file exposure
#
#-------------------------------[ HOW IT WORKS ]------------------------------------
#
# [1] --- Finds every folder whose name starts with 'wk'
# [2] --- For each, checks if a `.gitignore` containing:
#
#			* (ignore everything)
#			!.gitignore (but track this file)
#			!README.md (and track README if present)
#
#
#----------------------------------[ USAGE ]----------------------------------------
#		-- Run this script from the project root with:
#			./scripts/add_gitignore.sh
#
#-------------------------------[ REQUIREMENTS ]------------------------------------
#		-- must have execution permission chmod +x scripts/add_gitignore.sh
#
#------------------------------------------------------------------------------------- 

echo "[MESSAGE]: Adding .gitignore to all wk* folders..."

find . -type d -name "wk*" -exec bash -c '

    if [ ! -f "$0/.gitignore" ]; then 
        echo -e "*\n!.gitignore\n!README.md" > "$0/.gitignore"
        echo "[MESSAGE]: Created .gitignore in $0"
    else
        echo "[MESSAGE]: .gitignore already exists in $0, skipping."
     fi
' {} \;

echo "[MESSAGE]: Done adding .gitignore(s)."
