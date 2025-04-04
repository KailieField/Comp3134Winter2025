#!/bin/bash

echo "------------------------------------------------------------------------------"
echo "SCRIPT NAME: add_gitignores.sh"
echo "AUTHOR: Kailie Field"
echo "CREATED: 2025-04-04"
echo "------------------------------------------------------------------------------"
#--------------------------------[ PURPOSE ]----------------------------------------
# [1] ---- Automatically adds a `.gitignore` file inside each 'wk*' folder if missing
# [2] ---- Ensures each wkX folder is properly tracked by GitHub without revealing
#           internal structures like lab folders prematurely
# [3] ---- Supports cybersecurity best practices by controlling visibility and
#          reducing accidental file exposure
#
#-------------------------------[ HOW IT WORKS ]------------------------------------
#
# [1] --- Finds every folder whose name starts with 'wk'
# [2] --- For each, checks if a `.gitignore` exists. If not, creates it with:
#         * (ignore everything)
#         !.gitignore (but track this file)
#         !README.md (and track README if present)
#         !**/*.pdf, !**/*.png, !**/*.jpeg, !**/*.jpg (allow documents & images)
#
#----------------------------------[ USAGE ]----------------------------------------
#        -- Run this script from the project root with:
#            ./scripts/add_gitignores.sh
#
#-------------------------------[ REQUIREMENTS ]------------------------------------
#        -- must have execution permission: chmod +x scripts/add_gitignores.sh
#
#-------------------------------------------------------------------------------------

echo "[MESSAGE]: Adding .gitignore to Assignments/ and all wk* folders..."

for folder in Assignments wk01 wk02 wk03 wk04 wk06 wk09 wk10 wk11
do
    if [ -d "$folder" ]; then
        if [ ! -f "$folder/.gitignore" ]; then
            echo "[MESSAGE]: Creating .gitignore in $folder..."
            cat <<EOF > "$folder/.gitignore"
*
!.gitignore
!README.md
!**/*.md
!**/*.pdf
!**/*.png
!**/*.jpg
!**/*.jpeg
EOF
        else
            echo "[MESSAGE]: .gitignore already exists in $folder, skipping."
        fi
    else
        echo "[WARNING]: $folder does not exist, skipping."
    fi
done

echo "[MESSAGE]: Done adding .gitignore(s)."
