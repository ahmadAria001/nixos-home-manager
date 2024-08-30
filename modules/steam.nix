{pkgs, ...}: {
  programs.steam = {
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
}
