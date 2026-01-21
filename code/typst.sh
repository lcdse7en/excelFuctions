cargo install --git https://github.com/typst/typst --locked typst-cli --force

git clone git@github.com:lcdse7en/config.typst.book.git ~/github/config.typst.book
git clone git@github.com:lcdse7en/config.typst.exam.git ~/github/config.typst.exam

git clone git@github.com:lcdse7en/fontawesome.git ~/.local/share/fonts/fontawesome
git clone git@github.com:lcdse7en/typst.fonts.git ~/.local/share/fonts/typst.fonts
git clone git@github.com:lcdse7en/nerdfonts.git ~/.local/share/fonts/nerdfonts
git clone git@github.com:lcdse7en/koreafonts.git ~/.local/share/fonts/koreafonts

fc-cache -f
