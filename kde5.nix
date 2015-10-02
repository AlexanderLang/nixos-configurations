{ config, pkgs, lib, ... }:
with lib;
{
    require =
    [
        ./xserver.nix
    ];

    services.xserver.desktopManager.kde5 = {
        enable = true;
        phononBackends = [ "gstreamer" ];
    };

    services.xserver.displayManager.sddm = {
        enable = true;
        theme = "maui";
    };

    nixpkgs.config.packagesOverrides = in_pkgs : rec
    {
        # so pkgs dependend on qt4 don't pull full KDE workspace
        qt4 = in_pkgs.qt48;
    };

    environment.systemPackages = with pkgs; [
        kde5.sddm-kcm
        kde5.kate
        qvim
    ];
}
