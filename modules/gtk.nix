{pkgs, ...}: {
  # GTK theme configuration
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      gnomeShellTheme = true;
    };
    font = {
      name = "Roboto";
      size = 11;
    };
    gtk3 = {
      bookmarks = [
        "file:///home/tereza/Videos"
        "file:///home/tereza/Downloads"
        "file:///home/tereza/Music"
        "file:///home/tereza/Pictures"
        "file:///home/tereza/Public"
        "file:///home/tereza/Documents"
        "file:///home/tereza/.config"
      ];
    };
  };
}
