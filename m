From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 22:39:27 +0100
Subject: [Buildroot] Buildroot 2020.02.10 released
Message-ID: <87pn1kpz00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.10 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.10.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.10.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.10 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.9 release. The 2020.02.x series is
supported until April 2021.

- Security fixes for dbus, dovecot, dovecot-pigeonhole, gerbera, glibc,
  gst1-plugins-bad, mutt, nodejs, openjpeg, openldap, p11-kit, python3,
  socat, sudo, vlc, wavpack, wolfssl

- Fixes for download/compilation/runtime/license issues in brltty, gcc,
  gst-omx, gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
  gst1-plugins-ugly, gst1-rtsp-server, gst1-vaapi, gst1-validate,
  gstreamer1, gstreamer1-editing-services, libclc, lpc32xxcdl, luarocks,
  mpd, nfs-utils, opentracing-cpp, openvpn, p11-kit, paho-mqtt-c, php,
  poppler, runc, syslog-ng, systemd, tini, trace-cmd,
  wireguard-linux-compat, xapp_xload, xorriso

- Removed libupnp18 / added belle-sip, belr and libnpupnp packages
  (because of CallStranger security issue)

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.10

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02.9..

    48  Fabrice Fontaine
    22  Peter Korsgaard
    14  Bernd Kuhls
     7  Yann E. MORIN
     5  Thomas Petazzoni
     3  Bartosz Bilas
     3  Christian Stewart
     3  Peter Seiderer
     2  Petr Vorel
     2  Romain Naour
     2  Thomas De Schampheleire
     1  Angelo Compagnucci
     1  Edmundo Ferreira
     1  Francois Perrad
     1  J?rg Krause
     1  Maxim Kochetkov
     1  Titouan Christophe

-- 
Bye, Peter Korsgaard
