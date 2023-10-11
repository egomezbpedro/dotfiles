#! /usr/bin/env bash
#
lang=`echo "golang javascript terrafrom typescript lua python cpp" | tr ' ' '\n'`
coreutils=`echo "xargs sed awk find mv" | tr ' ' '\n'`

selected=`printf "$lang\n$coreutils" | fzf`
read -p "query: " query

if grep -q $selected <<< $lang; then
    tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
