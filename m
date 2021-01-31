From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 22:08:04 +0100
Subject: [Buildroot] Buildroot 2020.11.2 released
Message-ID: <87wnvsq0gb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.11.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.11.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.11.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.11.2 is a bugfix release, fixing a number of important /
security related issues discovered since the 2020.11.1 release.

- Download: Ensure git submodules are correctly fetched if enabled for a
  package with <pkg>_GIT_SUBMODULES = YES and the host variant is
  downloaded first.

- Toolchain: Mark CodeSourcery Aarch64 2014.11 toolchain as not having
  libatomic. Bootlin PowerPC-440 FP toolchain updated for SecurePLT fix.

- meson: Ensure ccache is not detected and used, as it may conflict with
  the ccache handling in Buildroot.

- Security fixes for dbus, dovecot, dovecot-pigeonhole, gerbera, glibc,
  libupnp, mutt, nodejs, openjpeg, openldap, p11-kit, php, python3,
  socat, sudo, vlc, wavpack, wolfssl

- Fixes for download/compilation/runtime/license issues in barebox,
  boost, brltty, docker-containerd, freescale-imx, gcc, kodi-pvr-zattoo,
  libclc, libfuse3, libodb-mysql, lpc32xxcdl, luarocks, mpd,
  multipath-tools, nfs-utils, opentracing-cpp, p11-kit, paho-mqtt-c,
  poppler, php, redis, resiprocate, rpm, runc, sslh,
  sunxi-mali-mainline-driver, syslog-ng, systemd, tini, tpm2-tss,
  trace-cmd, uboot-tools, uhd, util-linux, wireguard-linux-compat,
  xapp_xload, xorriso

- Removed libupnp18 package (because of CallStranger security issue)

or more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.11.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.11.1..

    34  Fabrice Fontaine
    17  Bernd Kuhls
    11  Peter Korsgaard
     7  Thomas Petazzoni
     7  Yann E. MORIN
     3  Bartosz Bilas
     3  Christian Stewart
     3  Peter Seiderer
     3  Thomas De Schampheleire
     2  Kalpesh Panchal
     2  Petr Vorel
     2  Romain Naour
     2  Tian Yuanhao
     2  Titouan Christophe
     1  Alexander Egorenkov
     1  Angelo Compagnucci
     1  Baruch Siach
     1  Edmundo Ferreira
     1  Fabio Estevam
     1  Francois Perrad
     1  Gary Bisson
     1  Giulio Benetti
     1  Gwenhael Goavec-Merou
     1  Jules Maselbas
     1  Konrad Schwarz
     1  Maxim Kochetkov
     1  Rob Mellor
     1  Veronika Kremneva
     1  Yair Ben-Avraham

-- 
Bye, Peter Korsgaard
