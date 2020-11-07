sudo sed -i 's/http\:\/\/download.example\/pub/https\:\/\/mirrors.dotsrc.org/g' /etc/yum.repos.d/*

sudo sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/*

sudo sed -i 's/metalink/#metalink/g' /etc/yum.repos.d/*

sudo sed -i 's/#metalink/metalink/g' /etc/yum.repos.d/fedora-cisco*

sudo dnf check-update -y

dnf check-update -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/rpmfusion*

sudo sed -i 's/metalink/#metalink/g' /etc/yum.repos.d/rpmfusion*

sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

sudo dnf groupupdate sound-and-video -y

sudo dnf check-update -y

dnf check-update -y

sudo sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config

sudo setenforce 0

sudo systemctl stop firewalld

sudo systemctl disable firewalld

sudo dnf install kernel-tools -y

sudo systemctl enable cpupower

sudo systemctl start cpupower

sudo echo -e "vm.swappiness = 0\nvm.vfs_cache_pressure = 1\nvm.dirty_background_bytes = 4194304\nvm.dirty_bytes = 4194304\n" >> /etc/sysctl.d/99-sysctl.conf

sudo sysctl -p

pkcon refresh

sudo pkcon refresh

flatpak remote-delete fedora

flatpak remote-delete fedora-testing
