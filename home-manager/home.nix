{ pkgs, ...}: {
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
		stylua
	    ast-grep
        gopls
	];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home.packages = with pkgs; [
    home-manager
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
    nerdfonts
    tdlib
    cmake
    gnumake
    gperf
    libressl_3_9
    rofi
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
