{ config, pkgs, ... }:
with pkgs;
{
    environment.systemPackages =
    [
        chromium
        thunderbird
        vlc
        dropbox
        kicad
        freecad
        texmaker
        idea.pycharm-professional
        idea.webstorm
        keepass
        gnuradio-full
        libreoffice
        hackrf
        python3
        python34Packages.ipython
        python34Packages.numpy
        python34Packages.matplotlib
        python34Packages.pyqt5
        python34Packages.pyserial
    ];
}

