{ pkgs, ...}: {
  home.packages = with pkgs; [
    home-manager
    neofetch
    neovim
    nodejs_22
    git
    waybar
    hyprpaper
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
    cloudflare-warp
  ];

  fonts.fontconfig.enable = true;

  home.username = "ss";

  home.homeDirectory = "/home/ss";

  home.stateVersion = "24.11";  
}
