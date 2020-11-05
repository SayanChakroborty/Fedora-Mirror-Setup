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
