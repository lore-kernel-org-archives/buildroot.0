From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 00:47:52 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20141111234844.23B6EB2DD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c2d758905423fd0cc564e431d81b1e2602071a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The description of important changes still needs to be added.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |  207 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 207 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index e239fcd..7e7f310 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,210 @@
+2014.11, Not yet released:
+
+	Fixes all over the tree and new features.
+
+	Updated/fixed packages: acl, acpid, agentpp, aircrack-ng,
+	alsa-lib, alsamixergui, alsa-utils, apitrace, apr, apr-util,
+	argus, arptables, at, atftp, atk, attr, audiofile, aumix,
+	automake, autossh, avahi, avrdude, axel, bandwidthd, bash,
+	bcusdk, beecrypt, bind, binutils, blackbox, bluez5_utils,
+	bluez_utils, bmon, boost, bootutils, bridge-utils,
+	btrfs-progs, busybox, bwm-ng, bzip2, ca-certificates, cairo,
+	ccache, ccid, ccrypt, cdrkit, cegui06, celt051, chrony,
+	cifs-utils, civetweb, cjson, clapack, classpath, cloog, cmake,
+	collectd, connman, copas, coreutils, coxpcall, cppcms, cppdb,
+	cppzmq, cramfs, crda, cryptsetup, ctorrent, cups, cvs, cwiid,
+	czmq, dash, dbus, dbus-cpp, dbus-glib, dbus-python, dejavu,
+	dhcp, dhcpcd, dhcpdump, dialog, dillo, directfb, distcc,
+	dmalloc, dmidecode, dmraid, dnsmasq, doc-asciidoc.mk,
+	dosfstools, dropbear, dropwatch, dstat, dtach, dtc, dvbsnoop,
+	e2fsprogs, ecryptfs-utils, ed, efl, eigen, elf2flt, elfutils,
+	enlightenment, enscript, erlang, espeak, ethtool, eudev,
+	evemu, evtest, exfat, exfat-utils, exim, expat, expect,
+	explorercanvas, faifa, fakeroot, fan-ctrl, fbdump,
+	fb-test-app, fetchmail, ffmpeg, file, filemq, findutils, flac,
+	flann, flickcurl, flite, fltk, fluxbox, fmc, fmlib,
+	fontconfig, foomatic-filters, freerdp, freescale-imx,
+	freetype, ftop, fxload, gamin, gcc, gd, gdb, gdk-pixbuf,
+	genimage, genpart, genromfs, geoip, gettext, giblib, git,
+	glibc, glib-networking, gmp, gmpc, gnu-efi, gnupg, gnupg2,
+	gnuplot, gnutls, google-breakpad, gpm, gpsd, gptfdisk,
+	gpu-viv-bin-mx6q, grantlee, grep, gsl, gst1-libav,
+	gst1-plugins-{bad,base,good,ugly}, gst-ffmpeg,
+	gst-fsl-plugins, gst-omx, gst-plugins-{bad,base,good,ugly},
+	gst-plugin-x170, gstreamer, gstreamer1, gtest, gtk2-engines,
+	gutenprint, gvfs, harfbuzz, haserl, haveged, hdparm, heimdal,
+	heirloom-mailx, hiawatha, hostapd, hplip, htop, httping,
+	hwdata, i2c-tools, icu, ifplugd, igh-ethercat, imagemagick,
+	imlib2, imx-lib, imx-vpu, inadyn, inotify-tools, input-tools,
+	intltool, iperf, iproute2, iprutils, ipsec-tools, ipset,
+	iptables, iputils, iw, jamvm, jansson, jasper, jimtcl, joe,
+	jpeg-turbo, jq, jquery-keyboard, jquery-mobile, jquery-ui,
+	jquery-ui-themes, jquery-validation, jsmin, json-c,
+	json-javascript, kbd, kexec, kexec-lite, keyutils, kismet,
+	kmod, knock, ktap, lame, lbase64, lbreakout2, lcdproc, lcms2,
+	lesstif, lftp, libaio, libao, libarchive, libargtable2,
+	libass, libassuan, libatasmart, libbluray, libbsd, libcap,
+	libcap-ng, libcdio, libcec, libcgicc, libcgroup, libcofi,
+	libconfig, libconfuse, libcurl, libdaemon, libdnet, libdrm,
+	libdvdnav, libecore, libedbus, libedit, libedje, libeet,
+	libelementary, libelf, libenca, libethumb, libevas,
+	libevas-generic-loaders, libevent, libexif, libeXosip2,
+	libffi, libftdi, libfuse, libgail, libgcrypt, libgeotiff,
+	libglade, libglib2, libgpgme, libgtk2, libhid, libidn,
+	libinput, libiscsi, libjson, libksba, liblockfile,
+	liblog4c-localtime, liblogging, libmad, libmatroska, libmbim,
+	libmemcached, libmicrohttpd, libmpdclient, libmpeg2, libndp,
+	libnfc, libnfs, libnftnl, libnl, libnspr, libnss, liboauth,
+	libogg, liboping, libosip2, libpcap, libpciaccess, libpfm4,
+	libplayer, libplist, libpng, libpthsem, libqmi, libqrencode,
+	libraw, libreplaygain, libroxml, librsvg, librtlsdr,
+	libsamplerate, libseccomp, libsecret, libshairplay, libsoc,
+	libsoup, libsoxr, libssh2, libstrophe, libsvg, libsvg-cairo,
+	libtasn1, libtheora, libtirpc, libtorrent, libubox, libuci,
+	libungif, liburcu, libusb, libuv, libv4l, libva,
+	libva-intel-driver, libvncserver, libvorbis, libvpx,
+	libwebsockets, libxcb, libxml2, libxml-parser-perl, libxmlrpc,
+	libxslt, lighttpd, linenoise, linknx, links, linphone,
+	linux-firmware, linux-fusion, linux-headers, linux-pam,
+	linux-zigbee, lite, live555, ljlinenoise, lmbench, lm-sensors,
+	localedef, lockdev, lockfile-progs, log4cxx, lpty, lrandom,
+	lrzsz, lshw, lsof, lsqlite3, ltp-testsuite, ltrace, ltris,
+	lttng-babeltrace, lttng-libust, lttng-modules, lttng-tools,
+	lua, luabitop, lua-coat, lua-coatpersistent, lua-csnappy,
+	lua-ev, luajit, luajson, lualogging, lua-messagepack,
+	lua-msgpack-native, luaposix, luarocks, luasec, luasocket,
+	luasql-sqlite3, lua-testmore, lunit, lvm2, lxc, lz4, lzlib,
+	lzma, m4, madplay, make, makedevs, Makefile.in,
+	matchbox-common, matchbox-desktop, matchbox-fakekey,
+	matchbox-keyboard, matchbox-lib, matchbox-panel,
+	matchbox-startup-monitor, matchbox-wm, mcrypt, mdadm,
+	media-ctl, mediastreamer, memcached, memstat, memtester,
+	mesa3d, metacity, midori, mii-diag, minidlna, mmc-utils,
+	modem-manager, mongoose, mongrel2, monit, mpc, mpd, mpdecimal,
+	mpfr, mpg123, mplayer, mrouted, msmtp, mtd, mtools, mtr,
+	musepack, musl, mutt, mxml, mysql, nano, nanocom, nbd, ncftp,
+	ncurses, ndisc6, ne10, neard, neon, netatalk, netperf,
+	netsnmp, nettle, net-tools, network-manager, newt, nfs-utils,
+	ngrep, nmap, nodejs, nss-mdns, ntfs-3g, ntp, numactl, nut,
+	nuttcp, ofono, ola, omap-u-boot-utils, omniorb,
+	on2-8170-modules, opencore-amr, opencv, openntpd, openobex,
+	openocd, openpowerlink, openssh, openssl, openswan,
+	opentyrian, opentyrian-data, openvpn, opkg, oprofile, opus,
+	opus-tools, orbit, orc, ortp, p11-kit, pango, parted,
+	pciutils, pcmanfm, pcre, pcsc-lite, perf, perl, perl-gd,
+	perl-gdgraph, perl-io-socket-ssl, perl-json-tiny,
+	perl-module-build, perl-mojolicious, perl-net-ssleay,
+	perl-path-tiny, perl-xml-libxml, perl-xml-parser, php,
+	php-geoip, php-gnupg, php-imagick, php-memcached, php-ssh2,
+	php-yaml, php-zmq, picocom, pifmrds, pinentry, pixman,
+	pkg-autotools.mk, pkg-cmake.mk, pkg-download.mk,
+	pkg-generic.mk, pkg-kconfig.mk, pkg-luarocks.mk, pkg-perl.mk,
+	pkg-python.mk, pkg-utils.mk, poco, polarssl, polkit, poppler,
+	popt, portaudio, portmap, postgresql, powerpc-utils, pppd,
+	pptp-linux, prboom, procps-ng, proftpd, protobuf, protobuf-c,
+	psmisc, ptpd2, pulseaudio, pv, pwgen, python, python3,
+	python-dialog, python-ipy, python-keyring, python-mad,
+	python-netifaces, python-numpy, python-protobuf, python-pyasn,
+	python-pyparsing, python-pyro, python-pyusb, python-serial,
+	python-setuptools, qdecoder, qemu, qextserialport, qjson, qt,
+	qt5, qt5base, qt5connectivity, qt5declarative, qt5enginio,
+	qt5graphicaleffects, qt5imageformats, qt5multimedia,
+	qt5quick1, qt5quickcontrols, qt5script, qt5sensors,
+	qt5serialport, qt5svg, qt5webkit, qt5webkit-examples,
+	qt5websockets, qt5x11extras, qt5xmlpatterns, qtuio, quagga,
+	quota, qwt, radvd, rapidjson, rdesktop, redis, rings, rpcbind,
+	rpi-firmware, rpi-userland, rpm, rp-pppoe, rrdtool,
+	rsh-redone, rsync, rsyslog, rtai, rtmpdump, rt-tests, rubix,
+	ruby, samba, sam-ba, samba4, sane-backends, schifra,
+	sconeserver, scons, screen, sdl, sdl_gfx, sdl_image,
+	sdl_mixer, sdl_net, sdl_sound, sdl_ttf, sed, ser2net,
+	setserial, sg3_utils, shared-mime-info, simicsfs, sispmctl,
+	slang, slirp, smcroute, smstools3, snmppp,
+	snowball-hdmiservice, socat, socketcand, sox, spawn-fcgi,
+	speex, spice, spice-protocol, sqlcipher, sqlite, squashfs,
+	squid, sredird, startup-notification, strace, stress,
+	strongswan, stunnel, subversion, sudo, sunxi-boards,
+	sunxi-cedarx, swig, sylpheed, synergy, sysklogd, sysstat,
+	systemd, sysvinit, taglib, tar, tcl, tcllib, tcpdump,
+	tcpreplay, texinfo, tftpd, thrift, thttpd, tiff, ti-utils,
+	tn5250, torsmo, trace-cmd, transmission, tslib, tstools,
+	tvheadend, twolame, tz, uboot-tools, uclibc, udisks, ulogd,
+	upmpdcli, upx, urg, usb_modeswitch, usbmount, usbredir,
+	usbutils, util-linux, valgrind, vde2, vim, vlc, vo-aacenc,
+	vorbis-tools, vpnc, vsftpd, vtun, wayland, webkit, webp,
+	webrtc-audio-processing, weston, wget, whois, wireless-regdb,
+	wireshark, wpa_supplicant, wvstreams, x11r7, x11vnc,
+	xapp_xcalc, xapp_xdm, xapp_xdpyinfo, xapp_xf86dga, xapp_xfs,
+	xapp_xinit, xapp_xkbevd, xapp_xmh, xapp_xrandr, xapp_xsm,
+	xbmc, xbmc-pvr-addons, xcb-proto, xcursor-transparent-theme,
+	xdriver_xf86-input-mouse, xdriver_xf86-video-{ast,intel},
+	xdriver_xf86-video-vmware, xenomai, xerces,
+	xfont_font-adobe-{100,75}dpi,
+	xfont_font-adobe-utopia-{100dpi,75dpi,type1},
+	xfont_font-alias, xfont_font-arabic-misc,
+	xfont_font-bh-100dpi, xfont_font-bh-75dpi,
+	xfont_font-bh-lucidatypewriter-100dpi,
+	xfont_font-bh-lucidatypewriter-75dpi, xfont_font-bh-ttf,
+	xfont_font-bh-type1, xfont_font-bitstream-100dpi,
+	xfont_font-bitstream-75dpi, xfont_font-bitstream-type1,
+	xfont_font-cronyx-cyrillic, xfont_font-cursor-misc,
+	xfont_font-daewoo-misc, xfont_font-dec-misc,
+	xfont_font-ibm-type1, xfont_font-isas-misc,
+	xfont_font-jis-misc, xfont_font-micro-misc,
+	xfont_font-misc-cyrillic, xfont_font-misc-ethiopic,
+	xfont_font-misc-meltho, xfont_font-misc-misc,
+	xfont_font-mutt-misc, xfont_font-schumacher-misc,
+	xfont_font-screen-cyrillic, xfont_font-sony-misc,
+	xfont_font-sun-misc, xfont_font-winitzki-cyrillic,
+	xfont_font-xfree86-type1, xfsprogs, xinetd, xkeyboard-config,
+	xlib_libdmx, xlib_libFS, xlib_libpciaccess, xlib_libSM,
+	xlib_libX11, xlib_libXaw, xlib_libXext, xlib_libXfont,
+	xlib_libXi, xlib_libXinerama, xlib_libXrandr, xlib_libXrender,
+	xlib_libXres, xlib_libXScrnSaver, xlib_libXt, xlib_libXv,
+	xlib_libXvMC, xlib_libXxf86dga, xlib_libXxf86vm, xmlstarlet,
+	xproto_xcmiscproto, xproto_xextproto, xscreensaver,
+	xserver_xorg-server, xterm, xz, zeromq, zlib, zlog, zmqpp,
+	znc, zsh, zxing
+
+	New packages: adwaita-icon-theme, am335x-pru-package,
+	bcache-tools, biosdevname, botan, canfestival, clamav,
+	cppunit, dos2unix, dovecot, dovecot-pigeonhole, getent, glm,
+	gst1-validate, hicolor-icon-theme, ipmitool, leafnode2,
+	libdvbcsa, libgtk3, libphidget, libshout, libunistring,
+	libupnpp, mesa3d-demos, modplugtools, mono, monolite, mp4v2,
+	netcat-openbsd, nginx, odhcploc, openvmtools,
+	phidgetwebservice, pps-tools, pure-ftpd,
+	python-configshell-fb, python-rtslib-fb, python-urwid, qlibc,
+	qt5location, shairport-sync, spidev_test, targetcli-fb,
+	tinyalsa, trinity, x264, yaml-cpp, ympd
+
+	Removed packages: libelf
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#261: New package: wxWidgets
+	#325: New package: ratpoison
+	#405: New package: OpenVZ tools
+	#1309: New package: rdiff-backup
+	#3427: New package: nginx
+	#3655: New package: libav
+	#3991: New Package: open-vm-tools (Vmware Tools)
+	#6878: dmraid: disabled on ARC
+	#6950: Full unicode support in ncurses
+	#7010: jamvm builds and runs fine under mips (be)
+	#7088: elfutils on Blackfin doesn't build
+	#7142: ecryptfs needs getent to run
+	#7280: CMake toolchain file uses the FORCE attribute on CMAKE_CXX_FLAGS
+	#7346: [2014.08rc3] vim-8ae50e3ef8bf.tar.gz can not be downloaded, ...
+	#7352: [2014.08-rc3] diffutils-3.3 failed on building
+	#7358: rpi-userland: linking with bcm_host doesn't give vc_dispmanx_*
+	#7364: monit builds a static application, even though BR2_PREFER_...
+	#7370: ngrep - requires --with-pcap-includes fully defined to find...
+	#7442: rootfs remount does not work as expected with sysvinit
+	#7448: Having export MACHINE="something" breaks glibc build on IMX6...
+	#7568: musl buildroot-toolchain does not put libgcc_s.so.1 into place
+	#7574: quota-4.01 fails to build statically
+
 2014.08, Released September 1st, 2014
 
 	Minor manual fixes/additions.
