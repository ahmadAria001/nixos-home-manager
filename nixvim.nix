{
  self,
  pkgs,
  lib,
  nixvim,
  xdg,
  helpers,
  ...
}: {
  imports = [
    nixvim.homeManagerModules.nixvim
    ./NixVim/autoCmd.nix
    ./NixVim/keymap.nix
    ./NixVim/options.nix
    ./NixVim/plugins.nix
    ./NixVim/colorschemes.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
    globals.mapleader = " ";

    opts = {
      shiftwidth = 2;
      number = true;
      relativenumber = false;

      autoindent = true;
      autoread = true;
    };

    withNodeJs = true;
    withRuby = true;
  };
}
