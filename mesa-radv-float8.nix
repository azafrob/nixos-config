{ pkgs ? import <nixpkgs> {} }:

pkgs.mesa.overrideAttrs (oldAttrs: {
  src = pkgs.fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "DadSchoorse";
    repo = "mesa";
    rev = "radv-float8-hack3";
    # You'll need to provide the hash of the source
    # You can use `lib.fakeSha256` first, then replace with the error message hash
    sha256 = "sha256-0000000000000000000000000000000000000000000=";
  };
  
  # If needed, add any additional build flags or dependencies
  # For example, if the branch needs specific build options:
  # mesonFlags = oldAttrs.mesonFlags ++ [ "-Dsomething=enabled" ];
})
