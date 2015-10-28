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
        theme = "maldives";
    };

    #nixpkgs.config.packageOverrides = in_pkgs : rec
    #{
    #    # so pkgs dependend on qt4 don't pull full KDE workspace
    #    qt4 = in_pkgs.qt48;
    #};
    
    nixpkgs.config.packageOverrides = super: let self = super.pkgs; in rec {
        plasma5_stable = self.plasma5_latest;
        kdeApps_stable = self.kdeApps_latest;
        qt4 = self.qt48;
    };
    
    hardware.pulseaudio = {
        enable = true;
        systemWide = true;
        package = pkgs.pulseaudioFull;
    };

    environment.systemPackages = with pkgs; [
        sddm
        kde5.sddm-kcm
        kde5.plasma-desktop
        kde5.plasma-framework
        kde5.plasma-mediacenter
        kde5.plasma-nm
        kde5.plasma-sdk
        kde5.plasma-workspace
        kde5.plasma-workspace-wallpapers
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
        kde5.kcodecs
        kde5.kmediaplayer
    ];
}
