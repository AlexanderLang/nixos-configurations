{ config, pkgs, ...}:
{
    require =
    [
        ../../base.nix
        ../../kde5.nix
        ../../applications.nix
        ../../users/alex.nix
    ];

    nix.maxJobs = 4;

    boot = {
        kernelModules = [ "kvm-intel" ];
        loader = {
            gummiboot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" ];
    };

    fileSystems."/" = {
        device = "/dev/disk/by-label/nixos";
        #options = "rw,data=ordered,realtime";
        fsType = "ext4";
    };

    #fileSystems."/boot" = {
    #    device = "/dev/disk/by-label/boot";
    #    options = "";
    #    fsType = "vfat";
    #};

    fileSystems."/home/alex/storage" = {
        device = "/dev/disk/by-label/data";
    };

    swapDevices = [
        { device = "/dev/disk/by-label/swap"; }
    ];

    networking = {
        hostName = "white-rabbit";
        networkmanager.enable = true;
    };

    services.xserver.synaptics = {
        enable = true;
        twoFingerScroll = true;
    };

}