From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Dec 2016 22:16:03 +0100
Subject: [Buildroot] Buildroot 2016.11.1 released
Message-ID: <87h95ma12k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2016.11.1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.11.1.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2016.11.1 is a bugfix release, fixing a number of important /
security related issues discovered since the 2016.11 release.

- Fixes for compilation/runtime issues in docker-engine, dovecot, vim
  and xorg-server.

- Security fixes for apache, cryptopp, docker-engine, dovecot, exim,
  gdk-pixbuf, libcurl, libupnp, links, monit, nodejs, openssh, php,
  python, python-bottle, samba4, squid and wireshark.

- A fix for how the legacy BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR is handled
  when older defconfig files using this option are used.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2016.11..
    12  Peter Korsgaard
     8  Gustavo Zacarias
     3  Bernd Kuhls
     1  Danomi Manchego
     1  Fabien Parent
     1  J?rg Krause
     1  Patrick Devlin
     1  Thomas Petazzoni
     1  Vicente Olivert Riera

-- 
Bye, Peter Korsgaard
