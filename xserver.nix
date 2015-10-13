{ config, pkgs, ... }:
{
    require = [
        ./fonts.nix
    ];
    
    services.xserver = {
        enable = true;
        autorun = true;
        exportConfiguration = true;
        layout = "us, at";
        xkbModel = "pc101";
        xkbOptions = "eurosign:e,terminate:ctrl_alt_bksp";
        vaapiDrivers = [ pkgs.vaapiIntel ];
    };
}

