{ pkgs, ... }:
{
  imports = [
    ./config/zsh.nix
    ./config/yazi.nix
    ./config/kitty.nix
    ./config/vscode.nix
    ./config/utils.nix
  ];

  home = {
    packages = with pkgs; [
      (callPackage ./custom/ptpython.nix { })
      (callPackage ./custom/cutefetch.nix { })
      (callPackage ./custom/ytgo.nix { })
      nixfmt-rfc-style
      nix-search-cli
      signal-desktop
      imagemagick
      lunarvim
      dfu-util
      visidata
      inkscape
      poppler
      cmatrix
      thonny
      ccache
      ffmpeg
      yt-dlp
      p7zip
      cmake
      ninja
      brave
      gimp
      ncdu
      hugo
      wget
      rar
      mpv
      nil
      go
      # love
      luajit
      luajitPackages.luarocks
    ];

    file = {
      ".config/lvim/config.lua".source = ./config/lvim.lua;
      ".config/ptpython/config.py".source = ./config/ptpython.py;
      ".config/zsh/zen".source = pkgs.fetchFromGitHub {
        owner = "cybardev";
        repo = "zen.zsh";
        rev = "2a9f44a19c8fc9c399f2d6a62f4998fffc908145";
        hash = "sha256-s/YLFdhCrJjcqvA6HuQtP0ADjBtOqAP+arjpFM2m4oQ=";
      };
    };

    # environment variables
    sessionVariables = {
      EDITOR = "lvim";
      PTPYTHON_CONFIG_HOME = "$HOME/.config/ptpython/";
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.11";
  };
}
