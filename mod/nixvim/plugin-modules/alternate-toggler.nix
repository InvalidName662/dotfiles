{ lib, ... }:
lib.nixvim.neovim-plugin.mkNeovimPlugin {
  name = "alternate-toggler";
  maintainers = [ ];
  settingsOptions = {
    alternates = lib.nixvim.mkNullOrOption lib.types.attrs "additional alternates";
  };
}
