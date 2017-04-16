# Intro

I run a dev network in virtual machines in Virtual Box.
One machine, cache.hif.lo, performs caching of packages
for apt, npm, pypi, and composer.  It also runs Apache and
serves up archive files over http.

At this time, this script is out of date, but is being
fixed for the latest software.

# Installation

This is an Ansible playbook to build the cache.hif.lo box.

Ansible self-hosts on the cache.hif.lo box.  

To install,

1. Create a new virtual machine and install Ubuntu Linux. Details below.
2. Copy this directory to the VM, and run ansible-setup.sh as root.  
3. Run install.sh as root.

Installation takes a **long** time, and the first time you hit
it, it's extremely slow.  It may even fail due to network 
congestion.  Just try re-running your scripts, and, if necessary,
rebooting the virutal machine.

# Setting up the VM, in more detail 

This could take a couple hours.

## A parent VM

I like to set up a "parent vm" from which I spawn other VMs.  It saves the
60 to 120 minutes it takes to install a VM at all.

I like using a "Vagrant" style setup.  This means that the admin user is "vagrant"
with a password of "vagrant". The root password is "vagrant" as well.  Then, I 
set the IP address to a designated, "never use" address
of 192.168.111.20.  

Set the network interface, in VBox, to bridged.

I use the following entry in /etc/network/interface.
Your network will differ.

    auto enp0s3
    iface enp0s3 inet static
      address 192.168.111.20
      netmask 255.255.0.0
      gateway 192.168.111.1
      broadcast 192.168.111.255
      dns-nameserver 192.168.111.2
      dns-search hif.lo

To restart networking:

    systemctl restart networking

Install ssh, sudo, and build tools for the guest additions:

    apt install sudo openssh-server gcc make 

Then upgrade packages:

   apt update && apt upgrade

Then download the latest VirtualBox Guest Additions ISO and install it.
Look in the about box in VBox and find the version number. Then download
the specific version from here:

    http://download.virtualbox.org/virtualbox/

Mount the cdrom and run the .run file.  Look for error messages.  Once it's OK, reboot.

This becomes my master image, and I build new VMs from this master image.

## The Cache VM

From the parent VM, I make a *linked* clone. That becomes the cache.

The static IP address for the cache is 192.168.111.17.

Install Ansible, as above.

