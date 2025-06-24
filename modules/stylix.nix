{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
stylix.enable = true;
stylix.autoEnable = true;
stylix.image = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/orangci/walls-catppuccin-mocha/master/dominik-mayer-24.jpg";
    sha256 = "j6AonV/8BeuceGFhpCwTY0T4BmCLXfw67fnQ99+oGyc=";
  };
  stylix.polarity = "dark";
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  stylix.fonts = {
    serif = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font";
    };

    sansSerif = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font";
    };

    monospace = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font Mono";
    };

    emoji = {
      package = pkgs.nerd-fonts.fira-code;
      name = "FiraCode Nerd Font Mono";
    };
  };
  stylix.opacity = {
    terminal = 0.85;
    desktop = 0.85;
  };
}
