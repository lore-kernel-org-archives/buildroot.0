From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Apr 2020 08:19:38 +0200
Subject: [Buildroot] Buildroot 2020.02.1 released
Message-ID: <87mu7ifssl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.1 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.1.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.1.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.1 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02 release. The 2020.02.x series is
supported until April 2021.

- core: Also fixup /lib references in libtool .la files, similar
  to how it is done for /usr/*.

- Various fixes for builds with per-package target/host directories.

- toolchain: Fix kernel headers validation check for external
  toolchains. Fix make 4.3+ compatibility in external toolchain logic.

- Security fixes for bluez5_utils, bubblewrap, gnutls, gvfs, haproxy,
  hiredis, hostapd, libical, libopenssl, libsndfile, ntp, php,
  pure-ftpd, python-pyyaml, redis, tor, wpa_supplicant

- Fixes for download/compilation/runtime/license issues in
  arm-trusted-firmware, barebox-aux, civetweb, cog, collectd, ffmpeg,
  gcc, gssdp, kmscube, kodi-screensaver-rsxs, libinput, linux,
  linux-tools, llvm, localedef, mesa3d, meson, nftables, opencv3,
  oprofile, polkit, quagga, rcw, rocksdb, samba4, screen, sdbusplus,
  swupdate, sysklogd, syslog-ng, tslib, util-linux,
  wireguard-linux-compat, wireguard-tools, vala, vlc, wireshark,
  xserver_xorg-server

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.1

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02..

    28  Fabrice Fontaine
    11  Thomas Petazzoni
    10  Peter Seiderer
     6  Bernd Kuhls
     6  Carlos Santos
     6  Peter Korsgaard
     6  Romain Naour
     4  Adam Duskett
     4  James Hilliard
     4  Yann E. MORIN
     3  Thomas De Schampheleire
     2  Fabio Estevam
     2  Gleb Mazovetskiy
     2  S?bastien Szymanski
     1  Alexander Dahl
     1  Alexander Mukhin
     1  Anatoly Borodin
     1  Baruch Siach
     1  Graham Rhodes
     1  John Keeping
     1  Joseph Kogut
     1  J?rg Krause
     1  Laurent Hartanerot
     1  Merlin B?ge
     1  Naz?m Gediz AYDINDO?MU?
     1  Pascal de Bruijn
     1  Robert Hancock
     1  Stefan S?rensen
     1  Titouan Christophe
     1  Yaroslav Syrytsia

-- 
Bye, Peter Korsgaard
