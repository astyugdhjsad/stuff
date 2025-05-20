# enter root
    cd ~
# install labwc and gdm3 
    apt install -y --no-install-recommends gdm3
    apt install -y labwc git
    apt remove -y nautilus
    apt install -y sudo nvim && apt remove -y nano && visudo
# install plymouth
     apt install -y plymouth
# configure grub
     sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
     sed -i 's/^GRUB_TIMEOUT_STYLE=.*/GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub
     sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/' /etc/default/grub
     sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="quiet"/' /etc/default/grub
     update-grub
# configure plymouth
    apt install -y plymouth-themes-spinner
    plymouth-set-default-theme spinner
    update-initramfs -u
# config labwc
    mkdir -p /home/dylan/.config/labwc/
    touch /home/dylan/.config/labwc/autostart
    echo -e "crystal-dock &&\nwaybar &&" > /home/dylan/.config/labwc/autostart
    apt install -y git waybar
    chmod 777 /home/dylan/.config/labwc/
    chmod 777 /home/dylan/.config/labwc/autostart
# install crystal dock
    apt install qt6-base-private-dev libwayland-dev liblayershellqtinterface-dev
    cmake -S src -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build --
    parallel
    cmake --install build
# clone shit
    git clone https://github.com/astyugdhjsad/stuff
    cd stuff
    mv wm/autostart /home/dylan/.config/labwc/autostart
