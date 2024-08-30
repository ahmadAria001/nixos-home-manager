{...}: {
  # Install git via home-manager module
  programs.git = {
    enable = true;
    userName = "ahmadAria001";
    userEmail = "73412887+ahmadAria001@users.noreply.github.com";
    signing = {
      key = "F59D9F8623103C48";
      signByDefault = true;
    };
    lfs.enable = true;
    delta = {
      enable = true;
      catppuccin.enable = true;
      options = {
        keep-plus-minus-markers = true;
        light = false;
        line-numbers = true;
        navigate = true;
        width = 280;
      };
    };
    extraConfig = {
      pull.rebase = "true";
    };
  };
}
