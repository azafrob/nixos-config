{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        spacing = 8;
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "cpu" "memory" "tray" "clock" ];

        "hyprland/window" = {
          format = "{}";  # Shows the window title
          max-length = 50;  # Truncate long titles
          separate-outputs = true;
        };

        tray = {
          spacing = 10;
        };

        clock = {
          interval = 1;
          timezone = "Europe/Madrid";
          format = " {:%a %d %b  %I:%M %p} ";
          tooltip = false;
        };

        cpu = {
          format = "{usage}% ";
        };

        memory = {
          format = "{}% ";
        };

        pulseaudio = {
          format = "{volume}%  / {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          on-click = "foot pulsemixer";
        };
      };
    };
  };
}
