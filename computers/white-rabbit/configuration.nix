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
            grub.enable = true;
            grub.device = "/dev/sda";
            grub.efiSupport = true;
            efi.canTouchEfiVariables = true;
        };
        initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" ];
        blacklistedKernelModules = [ "kvm" ];
    };

    fileSystems."/" = {
        device = "/dev/sda3";
        #options = "rw,data=ordered,realtime";
        fsType = "ext4";
    };

    fileSystems."/boot" = {
        device = "/dev/sda1";
        options = "";
        fsType = "vfat";
    };
    
    fileSystems."/media/kubuntu" = {
        device = "/dev/sda4";
    };

    fileSystems."/home/alex/storage" = {
        device = "/dev/sda5";
    };

    swapDevices = [
        { device = "/dev/sda2"; }
    ];

    networking = {
        hostName = "white-rabbit";
        networkmanager.enable = true;
        enableRTL8192cFirmware = true;
    };

    services.xserver.synaptics = {
        enable = true;
        twoFingerScroll = true;
    };
    
    hardware.bluetooth.enable = true;

}

