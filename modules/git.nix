{...}: {
  # Install git via home-manager module
  programs.git = {
    enable = true;
    userName = "ahmadAria001";
    userEmail = "razscer0@gmail.com";
    signing = {
      key = "F59D9F8623103C48";
      signByDefault = true;
    };
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
