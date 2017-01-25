From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 09:44:17 +0100
Subject: [Buildroot] Buildroot 2016.11.2 released
Message-ID: <87d1fbh6la.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2016.11.2 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2016.11.2.tar.gz

or

http://buildroot.net/downloads/buildroot-2016.11.2.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2016.11.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2016.11.1 release.

- Fixes for compilation/runtime issues in docker-engine, musl and runc.

- Security fixes for bind, docker-engine, gd, gnutls, go, imagemagick,
  irssi, libpng, libvncserver, musl, opus, php, rabbitmq-server, runc
  and wireshark.

- A fix for BR2_EXTERNAL trees referenced using relative paths,
  which broke in 2016.11.

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2016.11.1..
    10  Peter Korsgaard
     6  Gustavo Zacarias
     3  Vicente Olivert Riera
     2  Christian Stewart
     1  Baruch Siach
     1  Bernd Kuhls
     1  Fabrice Fontaine
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
