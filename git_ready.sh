#! /bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

#initailzing a directory multiple times wont do any harm
git init .

echo "*.swp" >  .gitignore
echo "*.swn" >> .gitignore
echo "*.swo" >> .gitignore
echo ".jshintrc" >> .gitignore

echo '{"esversion": 6}' > .jshintrc

echo "mocha" >     .git/hooks/pre-commit
echo "jshint ." >> .git/hooks/pre-commit

echo ""
echo -e "${GREEN}.gitignore"
echo -e "${GREEN}.jshintrc"
echo -e "${NC}.git/hooks/${GREEN}pre-commit ${NC}created"

