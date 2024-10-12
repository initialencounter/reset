# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.substituters = [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "ie";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
          fcitx5-chinese-addons
          fcitx5-gtk
      ];
    };
  };
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      # sarasa-gothic  #更纱黑体
      source-code-pro
      hack-font
      jetbrains-mono
    ];
  };
  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "24.05"; # Did you read the comment?

}
