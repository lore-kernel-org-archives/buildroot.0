From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Aug 2014 00:50:52 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20140807225118.B442B9D3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=087e1c8ef0b3c3e88da9a6a0a876ff4ecef1a801
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The description of important changes still needs to be added.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  116 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 116 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5b77292..c16f126 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,119 @@
+2014.08, Not yet released
+
+	Fixes all over the tree and new features.
+
+	Updated/fixed packages: aespipe, aiccu, alsa-lib, alsa-utils,
+	alsamixergui, argus, armadillo, at, atftp, atk, avahi,
+	avrdude, axel, b43-firmware, b43-fwcutter, bandwidthd, bc,
+	bcusdk, beecrypt, bind, binutils, blackbox, bluez5_utils,
+	bmon, boa, bonnie, bootutils, bsdiff, btrfs-progs, bustle,
+	busybox, bwm-ng, bzip2, ca-certificates, cairo, can-utils,
+	ccache, ccrypt, chrony, cifs-utils, classpath, cloog, cmake,
+	collectd, connman, coreutils, cosmo, cppcms, cramfs, crda,
+	cryptodev-linux, cryptodev, ctorrent, cvs, dbus-cpp,
+	dbus-glib, dbus-python, dbus, dcron, dejavu, devmem2,
+	dfu-util, dhcp, dhcpcd, dhcpdump, dhrystone, dialog, dillo,
+	distcc, dmidecode, dmraid, dnsmasq, doom-wad, dropbear,
+	dropwatch, dsp-tools, dtv-scan-tables, dvb-apps, e2fsprogs,
+	e2tools, eeprog, eigen, elf2flt, elftosb, enlightenment,
+	enscript, espeak, ethtool, eudev, evemu, exim, expedite,
+	explorercanvas, ezxml, faifa, fan-ctrl, fconfig, feh,
+	fetchmail, ffmpeg, fftw, file, fio, fis, flann, flashrom,
+	flex, flot, fltk, fontconfig, freerdp, freescale-imx,
+	freetype, ftop, gcc, gd, gdb, genimage, genromfs, gettext,
+	giblib, glib-networking, glibc, gmp, gnupg, gnutls, gpm, gpsd,
+	gptfdisk, gpu-viv-bin-imx6q, gqview, grantlee, gst-ffmpeg,
+	gst-fsl-plugins, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-ugly, gtk2-engines, gtk2-theme-hicolor, gtkperf,
+	gvfs, haserl, hdparm, hostapd, httping, i2c-tools, icu,
+	imagemagick, imx-lib, inadyn, inotify-tools, input-tools,
+	ipkg, iproute2, iputils, irda-utils, iw, jack2, jpeg, jquery,
+	jquery-keyboard, jquery-mobile, jquery-validation, jsmin, kbd,
+	kexec, kmod, knock, latencytop, lcdapi, leafpad, lesstif,
+	lftp, libaio, libarchive, libargtable2, libart, libatasmart,
+	libatomic_ops, libbsd, libcap-ng, libcec, libcgicc, libcgroup,
+	libconfuse, libcurl, libdrm, libdvdnav, libdvdread,
+	libeXosip2, libedit, liberation, libesmtp, libev, libevas,
+	libevdev, libevent, libfcgi, libffi, libfreefare, libfslcodec,
+	libfslparser, libfslvpuwrap, libgail, libgcrypt, libglade,
+	libglib2, libgpgme, libgtk2, libhid, libical, libiconv,
+	libiqrf, libjpeg, liblog4c-localtime, libmbus, libmicrohttpd,
+	libmms, libndp, libnftnl, libnl, libnspr, libnss, liboauth,
+	libpcap, libpng, libpthsem, libqmi, libraw, libraw1394,
+	librsvg, libsoc, libsoup, libsvgtiny, libsysfs, libtasn1,
+	libtirpc, libtorrent, libusb, libv4l, libwebsockets, libxcb,
+	libxml2, libyaml, links, linux-firmware, linux-fusion,
+	linux-headers, linux-pam, lite, live555, lm-sensors,
+	lockfile-progs, lpc3250loader, lshw, lsof, lsuio, ltrace,
+	ltris, lua-messagepack, luainterpreter, luajit, luaposix,
+	luarocks, lvm2, lxc, lz4, lzo, make, makedevs, mdadm,
+	mediastreamer, mesa3d, metacity, minidlna, mkpasswd,
+	modem-manager, mongoose, mpd, mpg123, msgpack, mtd, mtools,
+	mtr, musepack, musl, mysql, nano, nasm, nbd, ncurses, ndisc6,
+	netatalk, netplug, network-manager, nftables, ngircd, nodejs,
+	nss-mdns, ntp, nut, olsr, open2300, opencv, openntpd, openocd,
+	openpgm, openpowerlink, openssh, openssl, openswan, openvpn,
+	opkg, oprofile, opus-tools, orc, p910nd, pango, parted,
+	pax-utils, pcmanfm, perf, perl, perl-module-build, php,
+	pixman, pkgconf, poco, polarssl, popt, portmap, postgresql,
+	prboom, protobuf-c, proxychains-ng, psmisc, psplash, ptpd2,
+	python,
+	python-{bottle,dpkt,id3,mad,msgpack,nfc,pygame,pyzmq,simplejson},
+	python3, qhull, qt, qt5base, qt5connectivity, qt5declarative,
+	qt5graphicaleffects, qt5multimedia, qt5quickcontrols,
+	qt5sensors, qt5svg, qt5webkit, quagga, quota, radvd, rdesktop,
+	read-edid, rpcbind, rpi-firmware, rpi-userland, rpm,
+	rsh-redone, rsync, rt-tests, rtmpdump, rtorrent, rubix, ruby,
+	samba, samba4, sane-backends, sawman, sconeserver, setserial,
+	sg3_utils, shared-mime-info, smartmontools, smcroute, snappy,
+	socketcand, spawn-fcgi, sqlite, squashfs, squid, sredird,
+	startup-notification, statserial, strongswan, stunnel,
+	sunxi-mali, supervisor, synergy, sysklogd, sysprof, sysstat,
+	systemd, tcpdump, tcpreplay, texinfo, thrift, thttpd, ti-gfx,
+	ti-utils, tinyhttpd, torsmo, trace-cmd, transmission, tslib,
+	tstools, tvheadend, tzdata, uboot-tools, uclibc, udev,
+	udpcast, usb_modeswitch, usbmount, util-linux, valgrind, vim,
+	vlc, w_scan, wayland, webrtc-audio-processing, weston, wget,
+	wireless-regdb, wireless_tools, wireshark, wpa_supplicant,
+	xapp_{twm,xconsole,xcursorgen,xedit,xfs,xinit,xrandr},
+	xdriver_xf86-video-intel, xlib_lib{FS,ICE,Xext,Xfont,Xft,Xi},
+	xproto_fontsproto, xproto_inputproto, xserver_xorg-server,
+	x11vnc, xbmc, xbmc-addon-xvdr, xbmc-pvr-addons, xterm, xvkbd,
+	xz
+
+	New packages: flickcurl, fmc, fmlib, geoip, gnupg2,
+	google-breakpad, imx-vpu, isl, kexec-lite, libglew, libglu,
+	libinput, libksba, libmemcached, libmpdclient, librtlsdr,
+	libuv, libva, libva-intel-driver, linux-zigbee, memcached,
+	mpdecimal, ncmpc, opencore-amr, patchelf, perl-datetime-tiny,
+	perl-gd, perl-gdgraph, perl-gdtextutil, perl-io-socket-ssl,
+	perl-json-tiny, perl-mojolicious, perl-net-ssleay,
+	perl-path-tiny, perl-try-tiny, perl-xml-libxml,
+	perl-xml-namespacesupport, perl-xml-sax, perl-xml-sax-base,
+	php-geoip, php-memcached, pifmrds, pinentry, powerpc-utils,
+	procps-ng, pwgen, python-cffi, python-daemon, python-flup,
+	python-ipython, python-numpy, qt5enginio, qt5webkit-examples,
+	qt5websockets, simicsfs, sispmctl, sox, sshpass, tclap,
+	twolame, upmpdcli, whois, xlib_libxshmfence, xproto_dri3proto
+
+	Removed packages: procps
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5750: Doing a Buildroot build from /usr doesn't work
+	#5900: config flags to the Xenomai build system
+	#6230: Cannot compile gcc without threads (uClibc-based)
+	#6626: procps Unknown HZ value! (XX) Assume 100
+	#7118: Package "thrift" requires atomic operations
+	#7154: Local uClibc config file gets overwritten using ...
+	#7160: host-xz not built
+	#7166: hostapd: segfault when using RT5370
+	#7172: Name collision of rpath token expansion and internal..
+	#7178: NTPd package cannot sync time without a proper ntp.conf
+	#7184: supervisord depends on libxml2 implicitly
+	#7196: Unable to build on UBUNTU13.10
+	#7268: python 2.7 compilation issue on a Debian/Ubuntu ...
+
 2014.05, Released May 31st, 2014
 
 	Minor fixes.
