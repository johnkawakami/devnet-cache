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

1. Create a new virtual machine and install Ubuntu Linux and services listed below.
2. Copy this directory to the VM, and run ansible-setup.sh as root.  
3. Run install.sh as root.

Installation takes a long time, and the first time you hit
it, it's extremely slow.  It may even fail due to network 
congestion.  Just try re-running your scripts, and, if necessary,
rebooting the virutal machine.

# Setting up the VM, in more detail 

The static IP address 192.168.111.17 

I use the following entry in /etc/network/interface.
Your network will differ.

    auto eth0
    iface eth0 inet static
      address 192.168.111.17
      netmask 255.255.0.0
      gateway 192.168.111.1
      broadcast 192.168.111.255
      dns-nameserver 192.168.111.2
      dns-search hif.lo

Install ssh and sudo:

    apt install sudo openssh-server

Install Ansible, as above.

Then download the latest VirtualBox Guest Additions ISO and install it.
