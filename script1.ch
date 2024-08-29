#!/bin/bash
function dfinfo {

get_size() {
local path="$1"
local size=$(du -hs "$path" 2>/dev/null | cut -f1)
echo $size
}
items=$(ls -A)
result=()
IFS=$'\n'
for item in $items; do
size=$(get_size "$item")
result+=("$size $item")
done
}
function num {
echo -e "Нажмите 1 для отображения списка файлов:"
echo -e "Нажмите 2 для отображения списка файлов сортированных по уменьшению размера:"
}
while true
do
num
read i
if [[ $i = 1 ]]
then
echo "Список файлов:";
dfinfo
printf "%s\n" "${result[@]}" | column -t
break
elif [[ $i = 2 ]]
then
echo "Сортированный список файлов по уменьшению размера:";
dfinfo
printf "%s\n" "${result[@]}" | sort -rh | column -t
break
elif [[ $i > 2 ]]
then
echo -e "Нет такой команды!";
continue
fi
done
