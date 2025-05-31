{ pkgs, inputs, ... }:

let u = import <nixpkgs-unstable> { };

in {

  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      # formatters
      prettierd # overall
      stylua # lua
      gopls # go
      sourcekit-lsp # swift
      nixfmt-classic # .nix
      pyright # python

      # lsps
      vscode-langservers-extracted # html, css, json, js
      typescript-language-server
      svelte-language-server
      lua-language-server
      rust-analyzer
    ];
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

    # TUI- or CLI- apps
    neofetch
    git
    unzip
    wev
    wgcf # cloudflare
    ffmpeg
    tmux
    jp2a # image to ASCII
    bluetui

    # fonts and icons
    nerd-fonts.zed-mono

    # programming languages and compilers
    nodejs_22
    gcc
    go
    (python3.withPackages (python-pkgs: with python-pkgs; [ telethon ]))
    rustup

    # unsorted
    x265
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

  fonts.fontconfig.enable = true;

  home.username = "ss";

  home.homeDirectory = "/home/ss";

  home.stateVersion = "25.05";
}
