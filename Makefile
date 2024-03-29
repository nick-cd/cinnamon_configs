.PHONY: snap flatpak all games messaging mail viewing productivity camera editing browser music clean

all:
	apt install variety dmenu
	stow --dir="." --target="$(HOME)" variety/
	stow --dir="." --target="$(HOME)" scripts/
	stow --dir="." --target="$(HOME)" mint/
	stow --dir="." --target="$(HOME)" cinnamon/
	stow --dir="." --target="$(HOME)" gtk/
# https://forums.linuxmint.com/viewtopic.php?t=159521
	dconf load /org/cinnamon/ < ./cinnamon/.config/cinnamon-session/cinnamon.conf
	mkdir -p install/
	[ -d install/vimix-gtk-themes ] || git clone https://github.com/vinceliuice/vimix-gtk-themes install/vimix-gtk-themes
	install/vimix-gtk-themes/install.sh -t doder -c dark
	install/vimix-gtk-themes/install.sh -c dark -t amethyst
	[ -d install/vimix-icon-themes ] || git clone https://github.com/vinceliuice/vimix-icon-theme install/vimix-icon-themes
	install/vimix-icon-themes/install.sh -n doder

snap:
	rm -f /etc/apt/preferences.d/nosnap.pref
	apt update
	apt install snapd

flatpak:
	apt install flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

games: flatpak
	mkdir -p install/
	curl https://launcher.mojang.com/download/Minecraft.deb -o install/mc.deb
	dpkg -i install/mc.deb
	flatpak install flathub com.valvesoftware.Steam
	flatpak install flathub io.mrarm.mcpelauncher

messaging: flatpak
	flatpak install flathub com.discordapp.Discord
	flatpak install flathub io.bit3.WhatsAppQT
	stow --dir="." --target="$(HOME)" whatsapp/
	flatpak install flathub com.slack.Slack
	flatpak install flathub com.microsoft.Teams

mail: flatpak
	flatpak install flathub org.gnome.Geary

viewing: flatpak
	apt install pix
	flatpak install flathub org.gnome.Contacts
	flatpak install flathub org.gnome.Calendar

productivity: flatpak
	sh -c 'echo "deb https://linux.teamviewer.com/deb stable main" > /etc/apt/sources.list.d/teamviewer.list'
	apt update
	apt install teamviewer
	flatpak install flathub com.visualstudio.code

camera: flatpak
	flatpak install flathub org.gnome.Cheese

editing: snap flatpak
	snap install simplescreenrecorder
	flatpak install flathub org.gimp.GIMP
	flatpak install flathub org.audacityteam.Audacity
	flatpak install flathub org.olivevideoeditor.Olive

browser: snap
	snap install brave

music: flatpak
	flatpak install https://flathub.org/repo/appstream/de.haeckerfelix.Shortwave.flatpakref

clean:
	rm -rf install/ packages.microsoft.gpg
