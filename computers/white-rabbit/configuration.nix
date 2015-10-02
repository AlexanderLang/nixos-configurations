{pkgs, ...}:
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

    filesystems."/" = {
        device = "/dev/disk/by-label/nixos";
        options = "rw,data=ordered,realtime";
        fsType = "ext4";
    };

    filesystems."/boot" = {
        device = "/dev/disk/by-label/boot";
        options = "";
        fsType = "vfat";
    };

    swapDevices = [
        { device = "/dev/disk/by-label/swap"; }
    ];

    networking = {
        hostname = "white-rabbit";
        networkmanager.enable = true;
    };

    services.xserver.synaptics = {
        enable = true;
        twoFingerScroll = true;
    };

}