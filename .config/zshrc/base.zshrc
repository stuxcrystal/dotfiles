#!/bin/zsh

if [ "$WSL" = "yes" ]; then
    pushd /mnt/c > /dev/null
    WINTEMPPATH_RAW=$(cmd.exe /c "echo %TEMP%")
    WINTEMPPATH=$(wslpath $WINTEMPPATH_RAW | tr -d '\n' | tr -d '\r')
    popd > /dev/null
  
    if [ ! -e $WINTEMPPATH/weasel-pageant/helper.exe ]; then
        mkdir -p $WINTEMPPATH/weasel-pageant/
        cp $HOME/.config/weasel-pageant/helper.exe $WINTEMPPATH/weasel-pageant/helper.exe
    fi
    eval $($HOME/.config/weasel-pageant/weasel-pageant --reuse --helper $WINTEMPPATH/weasel-pageant/helper.exe) > /dev/null
    export PATH=$PATH:$HOME/.config/wsl/bin
fi
