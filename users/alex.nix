{config, pkgs, ...}:
with pkgs.lib;
{
    users.extraUsers.alex =
    {
        createHome = true;
        uid = 1000;
        group = "users";
        extraGroups = [ "wheel" "networkmanager" "dialout" ];
        home = "/home/alex";
        shell = "/run/current-system/sw/bin/zsh";
    };
}