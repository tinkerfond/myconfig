#!/bin/sh
echo $1
zathura -x "vim --servername $1 -c \"let g:syncpdf='$1'\" --remote +%{line} %{input}" $*
