# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    ./modules/hyprland.nix
    ./modules/waybar.nix
    ./modules/wofi.nix
    ./modules/mangohud.nix
    ./modules/stylix.nix
    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  # nixpkgs = {
    # You can add overlays here
    # overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    # ];
    # Configure your nixpkgs instance
    # config = {
      # Disable if you don't want unfree packages
      # allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      # allowUnfreePredicate = _: true;
    # };
  # };

  # TODO: Set your username
  home = {
    username = "vee";
    homeDirectory = "/home/vee";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];
  home.packages = with pkgs; [
    brave
    mpv
    steam
    hyprshot
    gamescope
    gamemode
    pulsemixer
    pamixer
    steamtinkerlaunch
    spotube
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.fastfetch.enable = true;
  programs.foot.enable = true;
  services.hyprpaper.enable = true;

  xdg.desktopEntries = {
    nvim = {
      name = "Neovim";
      type = "Application";
      icon = "nvim";
      exec = "${pkgs.foot}/bin/foot -e nvim %F";
    };
  };

  xdg.dataFile = {
    "Steam/compatibilitytools.d/SteamTinkerLaunch/compatibilitytool.vdf".text = ''
      "compatibilitytools"
      {
        "compat_tools"
        {
          "Proton-stl" // Internal name of this tool
          {
            "install_path" "."
            "display_name" "Steam Tinker Launch"
                                                                                   
            "from_oslist"  "windows"
            "to_oslist"    "linux"
          }
        }
      }
    '';
    "Steam/compatibilitytools.d/SteamTinkerLaunch/steamtinkerlaunch".source =
      config.lib.file.mkOutOfStoreSymlink "${pkgs.steamtinkerlaunch}/bin/steamtinkerlaunch";
    "Steam/compatibilitytools.d/SteamTinkerLaunch/toolmanifest.vdf".text = ''
      "manifest"
      {
        "commandline" "/steamtinkerlaunch run"
        "commandline_waitforexitandrun" "/steamtinkerlaunch waitforexitandrun"
      }
    '';
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Adrian";
    userEmail = "adrian.zafrarobledo@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
