.PHONY: all clean

all:
	sudo apt install variety
	sudo apt install audacity
	sudo apt install discord
	sudo apt install simplescreenrecorder
	mkdir -p install/
	[ -d install/vimix-gtk-themes ] || git clone https://github.com/vinceliuice/vimix-gtk-themes install/vimix-gtk-themes
	install/vimix-gtk-themes/install.sh -t doder -c dark
	install/vimix-gtk-themes/install.sh -c dark -t amethyst
	[ -d install/vimix-icon-themes ] || git clone https://github.com/vinceliuice/vimix-icon-theme install/vimix-icon-themes
	install/vimix-icon-themes/install.sh -n doder
	dconf load /org/ < cinnamon.conf

clean:
	rm -rf install/
