<img width="733" height="757" alt="image" src="https://github.com/user-attachments/assets/18859401-b30e-4112-925c-a83c22ddf5c0" />

<img width="843" height="409" alt="image" src="https://github.com/user-attachments/assets/c456fb49-65e3-446d-a24f-c6ddb1b196ea" />

Шар `tmux` вмикається комбінацією клавіш Tab + Enter. Кожна його клавіша надсилає `Ctrl+B`, а потім символ/дію короткого натискання відповідної клавіші базового шару. На цьому шарі утримання клавіш не активує модифікатори або інші шари.

Збірка трьох прошивок, указаних у `build.yaml`, через Docker: `./build.sh`. Готові файли `.uf2` зберігаються в `firmware/`.
