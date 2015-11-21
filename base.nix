{pkgs, ...}:
with pkgs;
{
    environment.systemPackages =
    [
        stdenv
        zsh
        e2fsprogs
        dosfstools
        gptfdisk
        wget
        git
        subversion
        vim
        nano
        gnupg
        usbutils
        pciutils
        gcc
        htop
        openjdk
        minicom
        refind
    ];

    programs.zsh = {
        enable = true;
        # shellInit = ?
    };

    users.defaultUserShell = "/run/current-system/sw/bin/zsh";
    
    users.extraGroups = {
        plugdev = { gid = 500; };
    };

    # Select internationalisation properties.
    i18n = {
        consoleFont = "Lat2-Terminus16";
        consoleKeyMap = "us";
        defaultLocale = "en_US.UTF-8";
    };

    nixpkgs.config = {
        allowUnfree = true;
    };

    time.timeZone = "Europe/Vienna";
    
    security.rtkit.enable = true;
}

