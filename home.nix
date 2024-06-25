{
  config,
  pkgs,
  inputs,
  catppuccin,
  ...
}: {
  imports = [
    inputs.ags.homeManagerModules.default
    ./system
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "tereza";
    homeDirectory = "/home/tereza";
    stateVersion = "23.11";
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

  catppuccin.flavor = "mocha";

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
    vscode
    postman
    telegram-desktop
    obsidian
    rofi

    obs-studio
    davinci-resolve

    hyprlock
    hypridle
    hyprpicker
    swww
    pamixer
    matugen
    dart-sass
    fd
    fzf

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

    rustc
    cargo

    libreoffice-qt
    hunspell
    hunspellDicts.uk_UA
    hunspellDicts.th_TH
    texlivePackages.poiretone

    typescript
    bun
    python310

    libdbusmenu-gtk3
    brightnessctl
    adwaita-qt6
    adwaita-qt

    cascadia-code

    #theme
    lxappearance
    lightly-qt
    libsForQt5.qt5ct
    catppuccin-gtk
    cron
    paper-icon-theme
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
    # EDITOR = "emacs";
  };

  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "hibernate";
          action = "systemctl hibernate";
          text = "Hibernate";
          keybind = "h";
        }
        {
          label = "suspend";
          action = "systemctl suspend";
          text = "Suspend";
          keybind = "s";
        }
        {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Logout";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];

      style = ''
        /* ----------- 💫 https://github.com/JaKooLit 💫 -------- */
        /* pywal-wlogout */

        /* Importing pywal colors */

        @import './colors/Catppuccin-Mocha.css';

        window {
            font-family: Fira Code Medium;
            font-size: 16pt;
            color:  @foreground; /* text */
            background-color: rgba(24, 27, 32, 0.2);

        }

        button {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 20%;
            background-color: transparent;
            animation: gradient_f 20s ease-in infinite;
            transition: all 0.3s ease-in;
            box-shadow: 0 0 10px 2px transparent;
            border-radius: 36px;
            margin: 10px;
        }

        button:focus {
            box-shadow: none;
            background-size : 20%;
        }

        button:hover {
            background-size: 50%;
            box-shadow: 0 0 10px 3px rgba(0,0,0,.4);
            background-color: @color6;
            color: transparent;
            transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
        }

        #shutdown {
            background-image: image(url("./icons/power.png"));
        }
        #shutdown:hover {
          background-image: image(url("./icons/power-hover.png"));
        }

        #logout {
            background-image: image(url("./icons/logout.png"));

        }
        #logout:hover {
          background-image: image(url("./icons/logout-hover.png"));
        }

        #reboot {
            background-image: image(url("./icons/restart.png"));
        }
        #reboot:hover {
          background-image: image(url("./icons/restart-hover.png"));
        }

        #lock {
            background-image: image(url("./icons/lock.png"));
        }
        #lock:hover {
          background-image: image(url("./icons/lock-hover.png"));
        }

        #hibernate {
            background-image: image(url("./icons/hibernate.png"));
        }
        #hibernate:hover {
          background-image: image(url("./icons/hibernate-hover.png"));
        }
      '';
    };

    ags = {
      enable = true;

      # null or path, leave as null if you don't want hm to manage the config
      # configDir = ../ags;

      # additional packages to add to gjs's runtime
      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
