#!/bin/zsh

CURRENT_IM=$(fcitx5-remote)
echo "Current input is : $CURRENT_IM"
if [[ "$CURRENT_IM" == "2" ]]; then
    fcitx5-remote -s "keyboard-us"
else
    fcitx5-remote -s "mozc"
fi
