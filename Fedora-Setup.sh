sudo -s << EOF

sed -i 's|download.example|mirror.math.princeton.edu|g' /etc/yum.repos.d/*

sed -i 's|#baseurl|baseurl|g' /etc/yum.repos.d/*

sed -i 's|metalink|#metalink|g' /etc/yum.repos.d/*

sed -i 's|#metalink|metalink|g' /etc/yum.repos.d/fedora-cisco*

dnf makecache -y

dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sed -i 's|download1.rpmfusion.org|mirror.math.princeton.edu/pub/rpmfusion|g' /etc/yum.repos.d/rpmfusion*

sed -i 's|#baseurl|baseurl|g' /etc/yum.repos.d/rpmfusion*

sed -i 's|metalink|#metalink|g' /etc/yum.repos.d/rpmfusion*

dnf groupupdate core -y

dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y

dnf groupupdate sound-and-video -y

dnf makecache -y

sed -i 's|SELINUX=enforcing|SELINUX=permissive|g' /etc/selinux/config

setenforce 0

systemctl stop firewalld

systemctl disable firewalld

dnf install kernel-tools -y

systemctl enable cpupower

systemctl start cpupower

echo -e "\nvm.swappiness = 0\nvm.vfs_cache_pressure = 1\nvm.dirty_background_bytes = 4194304\nvm.dirty_bytes = 4194304\n" >> /etc/sysctl.d/99-sysctl.conf

sysctl -p

pkcon refresh

flatpak remote-delete fedora

flatpak remote-delete fedora-testing

EOF

dnf check-update -y

pkcon refresh
