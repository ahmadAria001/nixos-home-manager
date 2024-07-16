{self, ...}: {
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = false;

      shiftwidth = 2;
    };
  };
}
