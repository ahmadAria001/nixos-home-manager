{pkgs, ...}: {
  services.wlsunset = {
    enable = true;
    latitude = -8.010429;
    longitude = 112.706139;
    gamma = 0.6;
  };
}
