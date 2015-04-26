From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Apr 2015 00:10:53 +0200
Subject: [Buildroot] [git commit] CHANGES: Update with recent changes
Message-ID: <20150426221114.1DB3B7FF3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94856075660dab56249fbe3452b34e489c2a79c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  129 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 129 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index dbd922a..9945fc6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,132 @@
+2015.05, Not yet released
+
+	Fixes all over the tree and new features.
+
+	Updated/fixed packages: agentpp, aircrack-ng, alsa-lib,
+	alsa-utils, apr-util, apr, atk, autossh, avahi, avrdude,
+	bdwgc, bind, binutils, bmon, boost, botan, btrfs-progs,
+	busybox, ca-certificates, cairo, can-utils, canfestival,
+	ccache, chrony, civetweb, cmake, collectd, connman, copas,
+	crda, cryptodev-linux, cryptsetup, cups, czmq, dbus-cpp,
+	dbus-glib, dbus-python, dbus, dfu-util, dhcp, dhcpcd, dialog,
+	dillo, dmraid, dnsmasq, dos2unix, dosfstools,
+	dovecot-pigeonhole, dovecot, dropbear, dropwatch,
+	dtv-scan-tables, dvdauthor, e2fsprogs, ecryptfs-utils,
+	libevas, elfutils, enscript, erlang, espeak, eudev, evemu,
+	exfat-utils, exim, f2fs-tools, feh, ffmpeg, fftw, flickcurl,
+	fltk, fluxbox, fmlib, fmtools, freeradius-client, freerdp,
+	gamin, gawk, gcc-final, gcc, gd, gdb, gengetopt, geoip, git,
+	glib-networking, gnu-efi, gnuchess, gnutls, gpsd, gptfdisk,
+	gstreamer, gstreamer1, gtest, gvfs, harfbuzz, haserl, haveged,
+	hiawatha, hicolor-icon-theme, hostapd, hplip, httping,
+	i2c-tools, icu, ifplugd, imagemagick, imlib2, iozone,
+	iproute2, iptables, iputils, irqbalance, iw, jack2, jhead,
+	jimtcl, json-c, kexec, kismet, kmod, kodi-audioencoder-flac,
+	kodi-audioencoder-vorbis, kodi-pvr-addons, kodi, ktap, lcms2,
+	libass, libbluray, libcap, libcgroup, libcurl, libdrm,
+	libdvbsi, libebml, libedit, liberation, libev, libevdev,
+	libftdi, libgcrypt, libglib2, libgpgme, libgtk2, libgtk3,
+	libiconv, libidn, libiio, libinput, libiscsi, libksba,
+	liblinear, libmatroska, libmicrohttpd, libmodbus,
+	libmpdclient, libnice, libnl, libnspr, libnss, libpcap,
+	libpciaccess, libphidget, libplayer, libqmi, librsvg,
+	libseccomp, libsigrok, libsoup, libsrtp, libssh2, libtasn1,
+	libtool, libunistring, liburcu, libusb, libuv,
+	libva-intel-driver, libva, libvncserver, libvorbis, libvpx,
+	libwebsockets, libxml2, libzip, lightning, lighttpd, linphone,
+	linux-firmware, linux-headers, linux-pam, live555, ljsyscall,
+	lmbench, lockdev, logrotate, lpc3250loader, lpeg, lsof,
+	lttng-libust, lttng-modules, lttng-tools, lua, luacrypto,
+	luafilesystem, luajit, luaposix, luarocks, lvm2, lxc, make,
+	matchbox-{common,desktop,fakekey,keyboard,lib,startup-monitor,vm},
+	matchbox, mcelog, memcached, memstat, memtest86, mesa3d,
+	minidlna, mjpegtools, mjpg-streamer, modem-manager, mongoose,
+	monit, mono, monolite, mp4v2, mpc, mpd, mpdecimal, mpg123,
+	mplayer, musl, nano, nbd, ncftp, ncmpc, ncurses, ne10, neard,
+	neardal, net-tools, netatalk, netsnmp, network-manager, nginx,
+	nodejs, ntfs-3g, ntp, numactl, odhcp6c, ofono, open2300,
+	opencv, openldap, openntpd, openocd, openssh, openssl,
+	openswan, opentyrian, openvmtools, openvpn, oprofile, p11-kit,
+	pango, patch, patchelf, pciutils, perf, perl-gdgraph,
+	perl-io-socket-ssl, perl-json-tiny, perl-module-build,
+	perl-mojolicious, perl-net-ssleay, perl-path-tiny,
+	perl-xml-libxml, perl, phidgetwebservice, php-gnupg, php,
+	pkgconf, polarssl, poppler, popt, postgresql, powerpc-utils,
+	pppd, prboom, procps-ng, proftpd, psplash, ptpd2,
+	python-{cheetah,coherence,django,markdown,netifaces,pam,six},
+	python-tornado, python-twisted, python-zope-interface, qemu,
+	qt, qt5, qt5base, qt5multimedia, qt5xmlpatterns, qt5cinex,
+	quagga, qwt, radvd, readline, rng-tools, rpcbind,
+	rpi-firmware, rpi-userland, rsync, rsyslog, rtai, rtmpdump,
+	ruby, sam-ba, samba, samba4, sconeserver, shairport-sync,
+	sigrok-cli, slang, smcroute, snmppp, socat, socketcand,
+	sofia-sip, sox, spawn-fcgi, speex, sqlcipher, sqlite, squid,
+	strace, strongswan, stunnel, sudo, sunxi-boards, swig,
+	sysstat, systemd, tcpdump, tftpd, thrift, thttpd, ti-gfx,
+	ti-utils, tiff, tinyalsa, tn5250, transmission, trinity,
+	tslib, tvheadend, tzdata, uboot-tools, uclibc, ulogd,
+	usb_modeswitch, usbutils, ustr, util-linux, vala, valgrind,
+	vlc, wayland, webp, weston, wget, which, whois,
+	wireless-regdb, wireless_tools, wireshark, wpa_supplicant,
+	wvstreams, xapp_{bdftopcf,bitmap,fonttosfnt,fslsfonts},
+	xapp_{fstobdf,iceauth,mkfontscale,oclock,rgb,sessreg,setxkbmap},
+	xapp_{showfont,smproxy,twm,x11perf,xcalc,xclipboard,xcmsdb},
+	xapp_{xdbedizzy,xditview,xdpyinfo,xdriinfo,xedit,xev,xeyes},
+	xapp_{xf86dga,xfsinfo,xgamma,xgc,xhost,xinit,xinput,xkbcomp},
+	xapp_{xkbevd,xkbprint,xlsatoms,xlsfonts,xmag,xman,xmh,xmodmap},
+	xapp_xmore, xcb-util-image, xcb-util-keysyms,
+	xdata_xcursor-themes,
+	xdriver_xf86-input-{evdev,keyboard,synaptics,void},
+	xdriver_xf86-video-{ati,cirrus,geode,mach64,mga,neomagic},
+	xdriver_xf86-video-{r128,savage,siliconmotion,sis,tdfx},
+	xdriver_xf86-video-{trident,vmware,voodoo}, xfont_font-util,
+	xkeyboard-config, xlib_lib{ICE,X11,Xdmcp,Xfont,Xpm,XvMC},
+	xlib_lib{Xxf86vm,xshmfence,xtrans}, xproto_randrproto,
+	xproto_xproto, xserver_xorg-server, x11vnc, x264, xerces,
+	xorriso, xterm, xz, yaml-cpp, zeromq, zic, zmqpp
+
+	New packages: apache, autoconf-archive, batctl,
+	bitstream-vera, bullet, doxygen, drbd-utils, dvdrw-tools,
+	gnuradio, gst1-imx, hans, hwloc, ijs, inconsolata, iodine,
+	iotop, ipmiutil, jsoncpp, leveldb, libdcadec, libdri2,
+	libfreeimage, libftdi1, libsidplay2, lirc-tools,
+	lua-periphery, mc, mesa3d-headers, mosquitto, nvidia-driver,
+	nvidia-tegra23{,-binaries,-codecs}, openjpeg, opusfile,
+	perl-crypt-openssl-{random,rsa}, perl-db-file,
+	perl-digest-{hmac,sha1}, perl-encode-{detect,locale},
+	perl-file-{listing,util}, perl-html-{parser,tagset},
+	perl-http-cookies, perl-http-{daemon,date,message,negotiate},
+	perl-io-html, perl-libwww-perl, perl-lwp-mediatypes,
+	perl-mail-dkim, perl-mailtools, perl-mime-base64,
+	perl-net-{dns,http}, perl-netaddr-ip, perl-time-hires,
+	perl-timedate, perl-uri, perl-www-robotrules, powertop,
+	pulseview, python-{cherrypy,lxml,mako,pyqt,sip,spidev,ws4py},
+	qpdf, qt-webkit-kiosk, sl, softether, sysdig, tinyxml2, tor,
+	tovid, unixodbc, wf111, wine, libepoxy, xapp_xcompmgr,
+	xapp_xfindproxy, xcb-util-cursor, xcb-util-renderutil,
+	xdriver_xf86-input-libinput, xdriver_xf86-video-imx,
+	xproto_xproxymanagementprotocol
+
+	Removed packages: gtk2-theme-hicolor
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#7478: Multiple chosen python modules are not built due to...
+	#7508: Use of BR2_EXTERNAL and dependencies to existing packages
+	#7676: Package procps-ng installs binaries to nonsensical folder
+	#7724: Startx is not installed in the target
+	#7760: botan: wrong prefix in botan-1.10.pc
+	#7826: Building of cdparanoia
+	#7844: Lua with hard-float on MIPS by buildroot doesn't work
+	#7874: X.org configure error
+	#7941: glibc-2.20 fails to build for sparc-buildroot-linux-gnu
+	#7951: gcc 4.9.2 fails to build for sparc-buildroot-linux-gnu
+	#7961: Qt5 fails to build for xtensa-buildroot-linux-uclibc
+	#7976: mkuser script fails with: user already exists with...
+	#8011: When building only busybox and strace, strace fails...
+	#8016: collectd fails to build, network.c:171:19: error:...
+	#8041: error on building libcurl7.42.0
+
 2015.02, Released March 1st, 2015
 
 	Minor fixes.
