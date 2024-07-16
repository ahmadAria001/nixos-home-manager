{...}: let
  wlogout_config = ./../files/configs/wlogout;
in {
  xdg.configFile = {
    "wlogout" = {
      recursive = true;
      source = "${wlogout_config}";
    };
  };
}
