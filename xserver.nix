{ config, pkgs, ... }:
{
    services.xserver = {
        enable = true;
        autorun = true;
        exportConfiguration = true;
        layout = "us";
        xkbOptions = "eurosign:e";
    }
}