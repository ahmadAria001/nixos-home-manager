# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nix, security, lib, ... }: let
unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Boot settings
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    consoleLogLevel = 4;
    initrd.verbose = true;
    kernelParams = ["quiet" "splash"];
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot.enable = true;
    loader.timeout = 10;
    plymouth.enable = true;

    extraModulePackages = with config.boot.kernelPackages; [
    	v4l2loopback
	lenovo-legion-module
    ];
    kernelModules = [
    	"v4l2loopback"
	#"lenovo-legion-module"
    ];

    supportedFilesystems = [ "ntfs" ];
  };

  systemd = {
	  user.services.lxqt-policykit = {
		description = "lxqt-policykit";
		wantedBy = [ "graphical-session.target" ];
		wants = [ "graphical-session.target" ];
		after = [ "graphical-session.target" ];
		serviceConfig = {
			Type = "simple";
			ExecStart = "${pkgs.lxqt.lxqt-policykit}/libexec/lxqt.lxqt-policykit";
			Restart = "on-failure";
			RestartSec = 1;
			TimeoutStopSec = 10;
		};
	  };
  };

  networking.hostName = "tereza_nix"; # Define your hostname.
 # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  security = {
  	polkit = {
		enable = true;
		adminIdentities = [
			"unix-user:tereza"
		];
	};
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
    	variant = "";
	layout = "us";
    };
  };

  nix = {
	package = pkgs.nix;
	settings = {
		experimental-features = [ "nix-command" "flakes" ];
	};
	gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
	};
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tereza = {
    isNormalUser = true;
    description = "TereZa";
    extraGroups = [ "networkmanager" "wheel" "input" "docker" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  virtualisation = {
  	docker = {
		enable = true;
		rootless = {
  			enable = true;
  			setSocketVariable = true;
		};
	};
  };

  # Allow unfree packages
  nixpkgs.config = {
  	allowUnfree = true;
	packageOverrides = pkgs: with pkgs; {
      		unstable = import unstableTarball {
        		config = config.nixpkgs.config;
        	};
    	};
  };

  services.displayManager = {
  	sddm = { 
		enable = true;

		extraPackages = with pkgs; [
			libsForQt5.qt5.qtquickcontrols2
			libsForQt5.qt5.qtsvg
			libsForQt5.sddm-kcm
			libsForQt5.qtgraphicaleffects
		];

		theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
	};
  };

  services.xserver = {
  	enable = true;
	windowManager = {
		awesome = {
			luaModules = with pkgs.luajitPackages; [
				luarocks-nix
				luadbi-mysql
			];
		};
	};
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    github-desktop
    git
    lshw
    fd
    nh
    fastfetch
    refind
    tree
    mlocate
    lxqt.lxqt-policykit
    
    waybar
    
    kitty
    alacritty

    libnotify

    swww
    swayosd
    rofi
    firefox

    anki
    gparted

    glib
    go
    jq
    (python312.withPackages (ps: with ps; [
    	pip
	virtualenv
	pip
        pygobject3
        gst-python
	requests
	conda
	scikit-learn
	matplotlib
	pandas
	numpy
	scipy
	ipython
	sympy
    ]))
    conda
    docker-compose

    pipenv
    qt6.qtwayland
    resources
    ripgrep
    unzip

    wl-clipboard
    zoom-us

    #HARDWARE PACKAGES
    lm_sensors
    psensor
    hardinfo
    inxi

    #THEME
    catppuccin-cursors
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  services.libinput.enable = true;
  services.blueman.enable = true;

  sound.enable = true;
  security.rtkit.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  services.displayManager.enable = true;
  services.pipewire = {
  	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
	extraConfig.pipewire."92-low-latency" = {
	  context.properties = {
	    default.clock.rate = 48000;
	    default.clock.quantum = 32;
	    default.clock.min-quantum = 32;
	    default.clock.max-quantum = 32;
	  };
	};

  };

  hardware = {
  	opengl = {
  		enable = true;
	};
	bluetooth = {
		enable = true;
		powerOnBoot = true;
		settings = {
			General = {
				Experimental = true;
			};
		};
	};
	#nvidia = {
	#    modesetting.enable = true;
	#    powerManagement.enable = true;
	#    powerManagement.finegrained = false;

	#    open = false;
	#    nvidiaSettings = true;
	#    package = config.boot.kernelPackages.nvidiaPackages.stable;

	#    prime = {
	#	offload = {
	#		enable = true;
	#		enableOffloadCmd = true;
	#	};

	#	nvidiaBusId = "PCI:01:0:0";
        #        amdgpuBusId = "PCI:06:0:0";
	#    };
	#};

  };
  #services.xserver.videoDrivers = [ "nvidia" ];

  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        USB_EXCLUDE_BTUSB = 1;

        RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

        DISK_IOSCHED = ["none"];

        # Battery charge thresholds for office usage
        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 50;

        # Battery charge thresholds for on-road usage
        # START_CHARGE_THRESH_BAT0 = 85;
        # STOP_CHARGE_THRESH_BAT0 = 90;
      };
  };
  services.power-profiles-daemon = {
  };
  # PATH configuration
  environment.localBinInPath = true;

  # Disable CUPS printing
  services.printing.enable = false;

  # Enable devmon for device management
  services.devmon.enable = true;

  services.dbus = {
	packages = [ pkgs.gnome3.gnome-keyring pkgs.gcr ];
  };

  xdg.portal = {
  	enable = true;
	extraPortals = with pkgs; [
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
	];
  };

  programs = {
  	hyprland = {
		enable = true;
		xwayland = {
			enable = true;
		};
		portalPackage = pkgs.xdg-desktop-portal-hyprland;
	};

	thunar = {
		enable = true;
		plugins = with pkgs.xfce; [
		  thunar-archive-plugin
		  thunar-volman
		];
	};

	steam = {
	    enable = true;
	    extraCompatPackages = with pkgs; [
	      proton-ge-bin
	    ];

	    extest.enable = true;
	    package = pkgs.steam-small.override {
	      extraEnv = {
		MANGOHUD = true;
		OBS_VKCAPTURE = true;
		RADV_TEX_ANISO = 16;
	      };
	      extraLibraries = p: with p; [
		atk
	      ];
	    };
	    extraPackages = with pkgs; [
	      gamescope
	    ];

	    gamescopeSession.enable = true;
	};

	zsh = {
		enable = true;
	};

	coolercontrol = {
		enable = true;
	#	nvidiaSupport = true;
	};
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["Meslo" "JetBrainsMono"];})
    roboto
  ];

  services.locate.enable = true;
  services.locate.localuser = null;
}
