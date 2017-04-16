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

1. Create a new virtual machine and install Ubuntu Linux.
2. Copy this directory to the VM, and run ansible-setup.sh as root.  
3. Run install.sh as root.

Installation takes a long time, and the first time you hit
it, it's extremely slow.  It may even fail due to network 
congestion.  Just try re-running your scripts, and, if necessary,
rebooting the virutal machine.
