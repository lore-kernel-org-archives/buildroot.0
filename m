From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 14:58:50 +0200
Subject: [Buildroot] Buildroot 2020.02.2 released
Message-ID: <87d079l379.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.org).

Buildroot 2020.02.2 is released - Go download it at:

http://buildroot.org/downloads/buildroot-2020.02.2.tar.gz

or

http://buildroot.org/downloads/buildroot-2020.02.2.tar.bz2

Or get it from Git:

git://git.buildroot.org/buildroot

Buildroot 2020.02.2 is a bugfix release on the current long term
release, fixing a number of important / security related issues
discovered since the 2020.02.1 release. The 2020.02.x series is
supported until April 2021.

- Musl: Disallow on PPC64 cores without AltiVec support	(E.G. e5500).

- fs/cpio: Correctly handle booting with 'console='

- release: Ensure temporary .br2-external.* files are not
  included in the release tarball

- Defconfigs: Fix various mistyped config options, or config
  options where the dependencies were no longer met.

- Security fixes for apache, c-ares, docker-engine, ffmpeg, freerdp,
  glibc, libhtp, libid3tag, libmad, libopenssl, libssh, libvncserver,
  mbedtls, openvpn, p7zip, php, python-markdown2, samba4, squid,
  suricata, vlc, webkitgtk, wireshark, wpewebkit

- Fixes for download/compilation/runtime/license issues in apache,
  azure-iot-sdk-c, binutils, boinc, cvs, docker-cli, docker-containerd,
  docker-engine, domoticz, e2fsprogs, efl, evtest, exim, ffmpeg, gcc,
  gflags, gnuconfig, haproxy, imx-gpu-g2d, irrlicht, kodi-pvr-vuplus,
  libarchive, libcoap, libfm-extra, libglib2, libinput, libsepol,
  libv4l, lvm2, mariadb, matchbox, mc, mesa3d-headers, meson, midori,
  msgpack, netsnmp, nginx, ogre, openjdk, openldap, paho-mqtt-c, php,
  polkit, python, python-attrs, python-crossbar, python-dpkt,
  python-flask, python-future, python-iptables, python-jedi, python3,
  qemu, qpdf, qt5, squashfs, tzdata, util-linux, vnstat, wget,
  wireguard-linux-compat, zic

For more details, see the CHANGES file:

https://git.buildroot.net/buildroot/plain/CHANGES?id=2020.02.2

Users of the affected packages are strongly encouraged to upgrade.

Many thanks to all the people contributing to this release:

git shortlog -sn 2020.02..

-- 
Bye, Peter Korsgaard
