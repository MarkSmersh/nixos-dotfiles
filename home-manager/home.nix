{ pkgs, inputs, ...}:

let pkgsUnstable = import <nixpkgs-unstable> {};
 
in

{
    programs.home-manager.enable = true;

    # stupid egror
    home.enableNixpkgsReleaseCheck = false;

    # home.backupFileExtension = "backup";

  programs.neovim = {
    enable = true;

	extraPackages = with pkgs; [
		typescript-language-server
		svelte-language-server
		nodePackages.prettier
		lua-language-server
		rust-analyzer
		python313
		gnumake
		lua-language-server
		djlint
        prettierd
		stylua
	    ast-grep
        gopls
        sourcekit-lsp
        vscode-langservers-extracted
	];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    neofetch
    nodejs_22
    git
    waybar
    wev
    pavucontrol
    hyprpaper
    wl-clipboard
    grim
    slurp
    telegram-desktop
    wgcf
    unzip
    gcc
    cargo
    yazi
    brightnessctl
    ffmpeg
    brave
    tmux
    go
    sqld
    (python3.withPackages (python-pkgs: with python-pkgs;
      [
        telethon
      ]
    ))
    pyright
    rofi
    postman
    # yaak
    # nerd-fonts.mplus
    nerdfonts
    pkgsUnstable.yaak
    vesktop
    swappy
    feh
  ];

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

  home.stateVersion = "24.11";  
}
