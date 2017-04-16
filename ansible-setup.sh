#
# Copy this to a virtual machines on the LAN and run it to set up with ansible.
# Run as root.  The VM should be running 64 bit linux, because Ansible's packages
# use the Ubuntu distro names.
#
# Uncomment the following if you want to use a caching proxy
# for the network.  (Leave it commented if you are building
# the caching proxy.)
#
#cat << EOF > /etc/apt/apt.conf.d/70proxy 
#Acquire::http::Proxy "http://192.168.111.17:3142";
#EOF

apt install -y software-properties-common
apt-add-repository ppa:ansible/ansible
apt update
apt install -y ansible
apt upgrade -y

