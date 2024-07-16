{
  config,
  pkgs,
  inputs,
  catppuccin,
  options,
  ladybird,
  ...
}: {
  imports = [
    ./modules/alacritty.nix
    ./modules/bat.nix
    ./modules/bottom.nix
    ./modules/cava.nix
    ./modules/discord.nix
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
      allowUnfreePredicate = _: true;
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
    postman
    telegram-desktop
    obsidian
    rofi-wayland
    easyeffects
    gnome.file-roller
    archiver
    gnome.gnome-weather
    gnome.gnome-clocks
    mpc-cli
    brave

    obs-studio
    davinci-resolve

    xdg-desktop-portal-hyprland
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
    hyprshade
    swww
    pamixer
    matugen
    dart-sass
    fd
    # fzf
    slurp
    grim
    swappy

    nix-prefetch-git

    pywal
    mako
    libnotify
    dart-sass
    webkitgtk
    sptlrx
    starship
    gtop
    auto-cpufreq
    icon-library
    playerctl

    meson
    stdenvNoCC
    rustc
    cargo
    nodejs
    php83
    php83Packages.composer
    php83Extensions.xdebug

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

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.catppuccin-gtk.override {
  #     accents = ["pink"];
  #     size = "compact";
  #     tweaks = ["rimless" "black"];
  #     variant = "macchiato";
  #   };
  #   name = "catppuccin-gtk";
  #   size = 16;
  # };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
