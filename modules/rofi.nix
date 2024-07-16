{pkgs, ...}: let
  rofi_config = ./../files/configs/rofi;
in {
  home.packages = with pkgs; [
    rofi-wayland
  ];

  xdg.configFile = {
    "rofi" = {
      recursive = true;
      source = "${rofi_config}";
    };
  };
}
