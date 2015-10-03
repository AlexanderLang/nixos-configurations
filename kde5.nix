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

    hardware.pulseaudio = {
        enable = true;
        systemWide = true;
        package = pkgs.pulseaudioFull;
    };

    environment.systemPackages = with pkgs; [
        kde5.sddm-kcm
        kde5.kate
        kde5.gwenview
        kde5.okular
        kde5.bluez-qt
        kde5.marble
        kde5.kwallet
        kde5.kwalletmanager
        kde5.dolphin-plugins
        kde5.ark
        kde5.baloo
        kde5.bluedevil
        kde5.frameworkintegration
        kde5.kaccounts-providers
        kde5.kaccounts-integration
        kde5.kde-baseapps
        pavucontrol
        qvim
    ];
}
