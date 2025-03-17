wget -O - https://github.com/akinomyoga/ble.sh/releases/download/nightly/ble-nightly.tar.xz | tar xJf - && 
bash ble-nightly/ble.sh --install ~/.local/share &&
rm -rf ble-nightly

