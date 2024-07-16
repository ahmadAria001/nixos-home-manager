{pkgs, ...}: let
  cava_config = ./../files/configs/cava;
in {
  home.packages = with pkgs; [cava];

  xdg.configFile = {
    "cava" = {
      recursive = true;
      source = "${cava_config}";
    };
  };
}
