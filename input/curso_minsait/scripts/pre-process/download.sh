
cd ../../raw

mkdir temp
curl -s https://github.com/caiuafranca/dados_curso > ./temp/arquivos.html
linkRaw="https://raw.githubusercontent.com/caiuafranca/dados_curso/main/"

grep -o -E 'title="([^"]+).csv"' ./temp/arquivos.html | grep -o -E '".+"' | grep -o -E '[a-zA-Z/./_]{0,}' > ./temp/arquivos.txt

mkdir arquivos
for file in $(cat "./temp/arquivos.txt")
do
  echo "$linkRaw$file"
  curl -o "arquivos/$file" "$linkRaw$file"
done