{
  config,
  pkgs,
  inputs,
  ...
}: let
  sharedModules = builtins.fromJSON (builtins.readFile ../../config/waybar/shared-modules.json);
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar =
        {
          output = "eDP-1";
          layer = "top";
          position = "top";
          height = 32;
          modules-left = [
            "clock"
            "hyprland/workspaces"
            "memory"
            "cpu"
            "network"
            "bluetooth"
          ];
          modules-right = [
            "hyprland/submap"
            "battery"
            "backlight"
            "custom/mako"
            "wireplumber"
            "user"
          ];
        }
        // sharedModules;
      fallback =
        {
          layer = "top";
          output = "!eDP-1";
          position = "top";
          height = 32;
          modules-left = [
            "clock"
          ];
          modules-right = [
            "hyprland/submap"
            "battery#standalone"
          ];
        }
        // sharedModules;
    };
  };
}
