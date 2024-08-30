{
  config,
  pkgs,
  inputs,
  catppuccin,
  options,
  ladybird,
  lib,
  ...
}: let 
in {
  imports = [
    ./modules/alacritty.nix
    ./modules/bat.nix
    ./modules/bottom.nix
    ./modules/cava.nix
    ./modules/discord.nix
    ./modules/eww.nix
    ./modules/fastfetch.nix
    ./modules/fzf.nix
    ./modules/git.nix
    ./modules/hyprland.nix
    ./modules/gpg.nix
    ./modules/gtk.nix
    ./modules/kitty.nix
    ./modules/krew.nix
    ./modules/lazygit.nix
    ./modules/rofi.nix
    ./modules/pyprland.nix
    ./modules/saml2aws.nix
    ./modules/scripts.nix
    ./modules/tmux.nix
    ./modules/ulauncher.nix
    ./modules/zoom.nix
    ./modules/zsh.nix
    ./modules/wlsunset.nix
    ./modules/wlogout.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "tereza";
    homeDirectory = "/home/tereza";
    stateVersion = "24.05";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg:
	builtins.elem (lib.getName pkg) [
	];
    };
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment=
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    zed-editor
    vscode
    dbeaver-bin
    beekeeper-studio
    postman
    telegram-desktop
    obsidian
    rofi-wayland
    easyeffects
    gnome.file-roller
    archiver
    gnome.gnome-weather
    gnome.gnome-clocks
    gnome.gnome-keyring
    mpc-cli
    brave
    kate
    lssecret
    libsecret
    ranger

    google-chrome

    obs-studio
    vlc
    davinci-resolve
    prismlauncher
    protonvpn-gui

    xdg-desktop-portal-hyprland
    xorg.xev
    dconf
    xwayland
    thefuck
    tmux
    networkmanagerapplet
    wlsunset
    wl-mirror
    scdoc
    sassc
    gtk-layer-shell
    dbus
    gobject-introspection
    libgee
    json-glib
    libhandy
    gvfs
    pantheon.granite
    vala

    hyprlock
    hypridle
    hyprpicker
    hyprcursor
    hyprshade
    hyprpicker
    swww
    pamixer
    matugen
    dart-sass
    fd
    slurp
    grim
    swappy
    lxqt.lxqt-policykit

    nix-prefetch
    nix-prefetch-git

    pywal
    mako
    libnotify
    dart-sass
    webkitgtk
    starship
    gtop
    auto-cpufreq
    icon-library
    playerctl

    meson
    stdenvNoCC
    rustc
    cargo
    clang
    nodejs
    nodePackages.pnpm
    php83
    php83Packages.composer
    php83Extensions.xdebug
    openjdk17-bootstrap
    nmap
    wireshark

    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    texlivePackages.poiretone

    argparse

    typescript
    bun

    libdbusmenu-gtk3
    gtk3
    brightnessctl
    pavucontrol
    adwaita-qt6
    adwaita-qt

    cascadia-code
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font

    #theme
    lxappearance
    nwg-look
    lightly-qt
    libsForQt5.qt5ct
    cron
    paper-icon-theme
    catppuccin-cursors

    chntpw
    parted
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tereza/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    wlogout = {
      enable = true;
    };
  };

  home.file = {
    "desktop-bg" = {
      source = ./files/wallpapers/desktop-bg;
    };

    "profile-pict.png" = {
      source = ./files/wallpapers/desktop-bg;
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors;
    name = "Catppuccin-MochaMauve";
    size = 16;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
