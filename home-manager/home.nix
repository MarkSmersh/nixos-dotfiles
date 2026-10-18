{ pkgs, inputs, ... }:

# let
#   u = import <nixpkgs-unstable> { };
#
# in
{
  programs.neovim = {
    enable = false;

    extraPackages = with pkgs; [ ];
  };

  home.packages = with pkgs; [
    # desktop
    waybar
    hyprpaper
    hyprlock
    hypridle

    # desktop's essentials (used in waybar or hypr- conf)
    brightnessctl
    wl-clipboard
    grim
    slurp
    feh
    wf-recorder
    yazi
    rofi
    calcurse
    zathura
    pulsemixer
    swappy

    # GUI apps
    telegram-desktop
    pavucontrol # do I need it?
    postman
    yaak # it has git sync though (postman alt)
    vlc
    obsidian
    # blockbench
    firefox
    gparted
    # krita
    # bruno # alt api 
    # apidog

    # TUI- or CLI- apps
    neofetch
    git
    unzip
    zip
    wev
    wgcf # cloudflare
    ffmpeg
    tmux
    jp2a # image to ASCII
    bluetui
    mesa-demos
    copyq
    uv
    parted
    wget
    openssl
    tdf # pdf
    wrk # for big load purposes :)
    ncdu # to clean pc
    yt-dlp

    # fonts and icons
    nerd-fonts.zed-mono

    # programming languages and compilers
    nodejs_24
    gcc
    gnumake
    go
    (python3.withPackages (python-pkgs: with python-pkgs; [ telethon aiogram ]))
    rustup
    jdk
    clang-tools

    # lsps
    jdt-language-server
    typescript-language-server
    vscode-langservers-extracted # html, css, json, js
    svelte-language-server
    lua-language-server
    # rust-analyzer
    kotlin-language-server
    java-language-server
    sqls

    # formatters
    prettierd # overall
    stylua # lua
    gopls # go
    # sourcekit-lsp # swift
    nixfmt-classic # .nix
    pyright # python
    sqruff # sql (sqls's formatter is gay)
    sleek # sql formatter, that is better than the previous

    # unsorted
    x265
    xorg.libX11
    xorg.libXcursor
    ntfs3g
  ];

  programs.home-manager.enable = true;

  # stupid egror
  home.enableNixpkgsReleaseCheck = false;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      allowUnsupportedSystem = true;
    };
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.material-cursors;
    name = "material_cursors"; # name is gotten from cursor.theme file
    size = 20;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  fonts.fontconfig.enable = true;

  home.username = "ss";

  home.homeDirectory = "/home/ss";

  home.stateVersion = "25.11";
}
