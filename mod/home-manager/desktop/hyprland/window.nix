{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.xfaf.desktop.hyprland.enable {
    wayland.windowManager.hyprland.extraConfig =
      # hyprlang
      ''
        bind = SUPER, r, submap, window

        submap = window

        bind = SUPER, r, submap, reset
        bind = , escape, submap, reset

        bind = , v, togglefloating,
        bind = , q, killactive,
        bind = , p, pin

        # resize window
        binde = , h, resizeactive,-10 0
        binde = ALT, h, resizeactive,-50 0
        binde = , l, resizeactive,10 0
        binde = ALT, l, resizeactive,50 0
        binde = , j, resizeactive,0 10
        binde = ALT, j, resizeactive,0 50
        binde = , k, resizeactive,0 -10
        binde = ALT, k, resizeactive,0 -50

        # move window
        binde = SHIFT, h, moveactive,-10 0
        binde = ALT SHIFT, h, moveactive,-50 0
        binde = SHIFT, l, moveactive,10 0
        binde = ALT SHIFT, l, moveactive,50 0
        binde = SHIFT, j, moveactive,0 10
        binde = ALT SHIFT, j, moveactive,0 10
        binde = SHIFT, k, moveactive,0 -10
        binde = ALT SHIFT, k, moveactive,0 -10

        # move window workspace
        bind = , 1, movetoworkspace, 1
        bind = , 2, movetoworkspace, 2
        bind = , 3, movetoworkspace, 3
        bind = , 4, movetoworkspace, 4
        bind = , 5, movetoworkspace, 5
        bind = , 6, movetoworkspace, 6
        bind = , 7, movetoworkspace, 7
        bind = , 8, movetoworkspace, 8
        bind = , 9, movetoworkspace, 9
        bind = , 0, movetoworkspace, 10

        submap = reset
      '';
  };
}
