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
    ];

    programs.zsh = {
        enable = true;
        # shellInit = ?
    };

    users.defaultUserShell = "/run/current-system/sw/bin/zsh";

    system = {
        stateVersion = "15.09";
        autoUpgrade = {
            enable = true;
            channel = "https://nixos.org/channels/nixos-15.09";
        };
    };

    nixpkgs.config = {
        allowUnfree = true;
    };

    time.timeZone = "Europe/Vienna";
}