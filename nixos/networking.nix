# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "ie";
    proxy = {
      default = "http://192.168.3.11:7890";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };
}
