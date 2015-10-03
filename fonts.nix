 
{ config, lib, pkgs, ... }:

{
    fonts = {
        enableFontDir = true;
        fonts = with pkgs; [
            corefonts
            dejavu_fonts
            inconsolata
            ubuntu_font_family
            unifont
        ];
     };
}

