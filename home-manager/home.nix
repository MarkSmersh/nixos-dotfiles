{ pkgs, ...}: {
  home.packages = with pkgs; [
    home-manager
    neofetch
    neovim
    nodejs_22
    git
    waybar
    wofi
    nautilus
    wev
    sway
    pavucontrol
    hyprpaper
    wl-clipboard
    grim
    slurp
    telegram-desktop
    wgcf
    unzip
    gcc14
    cargo
    rust-analyzer
  ];

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
