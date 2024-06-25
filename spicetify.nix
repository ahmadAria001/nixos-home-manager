{
  pkgs,
  lib,
  spicetify-nix,
  ...
}: let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  # import the flake's module for your system
  imports = [spicetify-nix.homeManagerModules.default];

  # configure spicetify :)
  programs.spicetify = let
    localFilesSrc = pkgs.fetchgit {
      url = "https://github.com/hroland/spicetify-show-local-files/";
      rev = "1bfd2fc80385b21ed6dd207b00a371065e53042e";
      sha256 = "01gy16b69glqcalz1wm8kr5wsh94i419qx4nfmsavm4rcvcr3qlx";
    };

    marketplaceSrc = pkgs.fetchgit {
      url = "https://github.com/spicetify/marketplace/";
      rev = "6f210f80f1d14b86f164b4b7fc068bc2e885276d";
      sha256 = "sha256-RDAv4NtDwTvDOxH16/vBcH34+fH0jAXjJ/Cy9lRqchY=";
    };
  in {
    spotifyPackage = pkgs.spotify;

    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";

    enabledCustomApps = with spicePkgs.apps; [
      new-releases
      lyrics-plus
      reddit
      marketplace
    ];

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      brokenAdblock
      volumePercentage
      history
    ];
  };
}
