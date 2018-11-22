#install js-beautify > sudo npm install -g js-beautify
js-beautify $1 > .beautified

mv .beautified $1

GREEN='\033[0;32m'
LIGHTGRAY='\033[0;37m'
NC='\033[0m'

echo "${GREEN} $1 ${NC} is beautified"
echo "${LIGHTGRAY} plz run test to see if something is broken ${NC}"
