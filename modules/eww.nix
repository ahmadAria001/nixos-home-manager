{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    eww
  ];

  # programs.eww = {
  #   enable = true;
  #   configDir = ./.;
  # };
}
