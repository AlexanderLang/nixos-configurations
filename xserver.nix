{ config, pkgs, ... }:
{
    require = [
        ./fonts.nix
    ];
    
    services.xserver = {
        enable = true;
        autorun = true;
        exportConfiguration = true;
        layout = "us";
        xkbOptions = "eurosign:e";
    };
}