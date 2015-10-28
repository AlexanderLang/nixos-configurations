{ config, pkgs, ... }:
with pkgs;
{
    environment.systemPackages =
    [
        chromium
        thunderbird
        vlc_qt5
        openh264
        mplayer
        dropbox
        kicad
        freecad
        transmission
        transmission_gtk
        texmaker
        idea.pycharm-professional
        idea.webstorm
        keepass
        gnuradio-full
        libreoffice
        hackrf
        mariadb
        mysqlWorkbench
        python3
        python34Packages.dateutil
        python34Packages.pyparsing
        python34Packages.ipython
        python34Packages.numpy
        python34Packages.six
        python34Packages.matplotlib
        python34Packages.sip_4_16
        python34Packages.pyqt5
        python34Packages.pyserial
    ];
    
    services.udev.extraRules = ''
        ATTRS{idVendor}=="1d50", ATTR{idProduct}=="6089", SYMLINK+="hackrf-one-%k", MODE="660", GROUP="plugdev"
    '';
    
    environment.profileRelativeEnvVars = {
        PYTHONPATH = [ "/lib/python3.4/site-packages" ];
    };
    
    nixpkgs.config = {
        chromium.enablePepperFlash = true;
    };
}

