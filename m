From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Mar 2019 09:12:41 +0100
Subject: [Buildroot] Buildroot 2019.02.1 released
Message-ID: <871s2okcg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2019.02.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2019.02.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2019.02.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2019.02.1 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2019.02 release.

- pkg-generic: Only tweak .la files needing it to ensure they
  are not included in subsequent package file lists.

- Security fixes for asterisk, avahi, busybox, clamav, cups, file,
  glibc, jq, libseccomp, libssh2, mariadb, nodejs, ntp, openjpeg, php,
  putty, rdesktop, samba4, wireshark, xapp_xdm, xlib_libXdmcp

- Fixes for download/compilation/runtime issues in bash, beecrypt,
  binutils, efl, eigen, fetchmail, flashrom, fltk, gerbera, git,
  gnuradio, go, gst-plugins-bad, intel-gmmlib, kexec,
  kf5-modemmanager-qt, leveldb, libcurl, libdrm, libftdi1, libglib2,
  libiio, libpcap, log4cplus, lvm2, mender, mongodb, mosquitto, musl,
  owfs, pure-ftpd, python-aiojobs, qt5webkit, sunxi-tools, supertux,
  swupdate, vsftpd, xdriver_xf86-video-fbdev, xen

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2019.02.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2019.02..

    40  Fabrice Fontaine
    15  Peter Korsgaard
     7  Baruch Siach
     4  Bernd Kuhls
     3  Ga?l PORTAY
     3  Vadim Kochan
     2  Adam Duskett
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Artem Senichev
     2  Jared Bents
     2  Norbert Lange
     2  Romain Naour
     1  Abdelmalek Benelouezzane
     1  Adrien Gallou?t
     1  Alexandru Ardelean
     1  Alistair Francis
     1  Artem Panfilov
     1  Christian Stewart
     1  James Hilliard
     1  Michel Stempin
     1  Reed Nightingale
     1  Ryan Coe
     1  Samuel Mendoza-Jonas
     1  Yann E. MORIN

-- 
Bye, Peter Korsgaard
