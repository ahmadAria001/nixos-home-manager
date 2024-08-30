{...}: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
    theme = "Catppuccin-Mocha";
  };
}
