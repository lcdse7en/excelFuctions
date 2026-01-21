chsh -s /usr/bin/fish

git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si

git config --global user.name "lcdse7en"
git config --global user.email "2353442022@qq.com"
ssh-keygen -t ed25519 -C 2353442022@qq.com
sudo systemctl enable --now sshd

sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd --needed
sudo pacman -S fish bob lazygit fastfetch starship eza zathura zathura-pdf-poppler xsel
sudo pacman -S tree-sitter-cli trash-cli dolphin tmux uv kdenlive
sudo pacman -S mpv mpc mpd rmpc exiftool pipewire pipewire-pulse --needed # pactl info
sudo pacman -S pamixer btop nodejs npm unzip unarchiver github-cli yt-dlp

systemctl --user daemon-reexec
systemctl --user enable --now pipewire pipewire-pulse wireplumber

sudo systemctl disable mpd.{socket,service} --now
systemctl --user enable mpd.service --now
systemctl --user status mpd.service
git clone git@github.com:lcdse7en/Music.git ~/Music
mpc update

#yazi
sudo pacman -S yazi 7zip jq fd ripgrep fzf zoxide resvg imagemagick nsxiv rsync
paru -S duckdb

#niri
sudo pacman -S niri xdg-desktop-portal-gnome xdg-desktop-portal-gtk
sudo pacman -S alacritty ghostty kitty
paru -S xwayland-satellite-git
paru -S matugen wl-clipboard cliphist cava qt6-multimedia-ffmpeg zen-browser
paru -S quickshell gpu-screen-recorder brightnessctl ddcutil wlsunset xdg-desktop-portal
paru -S evolution-data-server polkit-kde-agent

mkdir -p ~/.config/quickshell/noctalia-shell && curl -sL https://github.com/noctalia-dev/noctalia-shell/releases/latest/download/noctalia-latest.tar.gz | tar -xz --strip-components=1 -C ~/.config/quickshell/noctalia-shell

niri msg outputs # show monitors
niri-session

git clone git@github.com:lcdse7en/config.niri.git ~/.config/niri
git clone git@github.com:lcdse7en/config.ghostty.git ~/.config/ghostty
git clone git@github.com:lcdse7en/config.nvim.git ~/.config/nvim
git clone git@github.com:lcdse7en/config.fish.git ~/.config/fish
git clone git@github.com:lcdse7en/config.starship.git ~/.config/starship
git clone git@github.com:lcdse7en/config.zathura.git ~/.config/zathura
git clone git@github.com:lcdse7en/config.rmpc.git ~/.config/rmpc
git clone git@github.com:lcdse7en/config.mpd.git ~/.config/mpd
