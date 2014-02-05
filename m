From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 05 Feb 2014 18:41:34 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
In-Reply-To: <20140204085344.ED7A89C786@busybox.osuosl.org>
References: <20140204085344.ED7A89C786@busybox.osuosl.org>
Message-ID: <52F277CE.7040605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 09:45, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=51a2caf912e24c064561c54533ba0e221b7a6f09
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  CHANGES |   82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 82 insertions(+), 0 deletions(-)
> 
> diff --git a/CHANGES b/CHANGES
> index d75d8b1..8b5395e 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,85 @@
> +2014.02, Not yet released:
> +
> +	Fixes all over the tree and new features.

 We should probably mention the renaming of BUILDROOT_CONFIG explicitly.
And also all of the newly deprecated things and legacy symbols should be
mentioned.

 Regards,
 Arnout

> +
> +	Updated/fixed packages: aiccu, alsa-lib, alsa-utils, aumix,
> +	autoconf, automake, barebox, bellagio, berkeleydb, binutils,
> +	bison, blackbox, bluez_utils, boost, bustle, busybox, cairo,
> +	can-utils, ccache, ccid, cgilua, cifs-utils, civetweb, cmake,
> +	collectd, connman, copas, coreutils, coxpcall, cppzmq, cramfs,
> +	crda, cryptodev-linux, cryptsetup, cups, czmq, dhcpcd,
> +	dhcpdump, dialog, dnsmasq, dosfstools, dropbear, dropwatch,
> +	dtc, duma, dvb-apps, e2fsprogs, eglibc, eigen, erlang,
> +	ethtool, f2fs-tools, ffmpeg, file, filemq, fio, flashrom,
> +	flex, fluxbox, fontconfig freerdp, freetype, gadgetfs-test,
> +	gawk, gcc, gdb, gdbm, gettext, git, glibc, gnupg, gnutls,
> +	gob2, gpsd, grep, grub, gst-ffmpeg, gst-plugins-good,
> +	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
> +	gst1-plugins-ugly, gstreamer, gstreamer1, gtest, iftop,
> +	imagemagick, inadyn, infozip, iozone, iproute2, iptables, iw,
> +	jpeg, jq, kmod, knock, lbase64, lcdapi, lftp, libcdaudio,
> +	libcgi, libcgicc, libcuefile, libcurl, libdmtx, libdrm,
> +	libdvdnav, libdvdread, libegl, libevent, libexif, libfcgi,
> +	libfreefare, libgles, libglib2, libllcp, libmicrohttpd,
> +	libmpd, libnfc, libnl, libnss, libopenmax, libopenvg, libpcap,
> +	libpfm4, libplayer, libpng, libqmi, libreplaygain, libroxml,
> +	libsamplerate, libsexy, libsigsegv, libsndfile, libsoc,
> +	libtasn1, libtpl, libusb, libusb-compat, libvorbis, libxcb,
> +	libxml2, lighttpd, linknx, linux-firmware, linux-pam, live555,
> +	lm_sensors, lmbench, lockdev, logrotate, lrzsz, ltrace, lua,
> +	lua-ev, lua-msgpack-native, luabitop, luaexpat, luaexpatutils,
> +	luafilesystem, luajit, luaposix, luarocks, luasec, luasocket,
> +	luasql-sqlite3, m4, matchbox, mdadm, minicom, mongrel2, mpc,
> +	mpd, mpg123, mplayer, mtd, mysql, lvm2, mxml, ncurses, ne10,
> +	neard, neardal, netsnmp, netstat-nat, network-manager, nodejs,
> +	numactl, ofone, ola, olsr, omniorb, opencv, openpowerlink,
> +	openssh, openssl, openvpn, oprofile, opus, opus-tools, orbit,
> +	p11-kit, parted, pcre, pcsc-lite, perl, php, poco, poppler,
> +	powervr, protobuf-c, psplash, python, python-bottle,
> +	python-{crc16,distutilscross,dpkt,id3,ipy,m2crypto,mad,meld},
> +	python-{netifaces,nfc,protobuf,pygame,pyparsing,pyro,pyzmq},
> +	python-{serial,setuptools}, qt, qt5base, qt5connectivity,
> +	qt5declarative, qt5graphicaleffects, qt5jsbackend,
> +	qt5multimedia, qt5quick1, qt5quickcontrols, qt5script,
> +	qt5webkit, radvd, redis, rings, rng-tools, rpi-firmware,
> +	rpi-userland, rt-tests, sam-ba, samba, sawman, sconeserver,
> +	scons, sdl, sg3_utils, snappy, snmppp, socketcand, spice,
> +	spice-protocol, sqlcipher, sqlite, squid, sshfs, strace,
> +	subversion, sunxi-mali, supervisor, sysklogd, sysprof,
> +	sysstat, systemd, sysvinit, taglib, tar, tcpdump, ti-gfx,
> +	ti-utils, tinymembench, tn5250, trace-cmd, transmission,
> +	tvheadend, tzdata, zxing, uboot, uboot-tools, uclibc, udev,
> +	ulogd, urg, usb_modeswitch_data, util-linux, vala, valgrind,
> +	vorbis-tools, wavpack, wayland, weston, wget, wireless-regdb,
> +	wireshark, wpa_supplicant, wsapi, xavante, xapp_xdpyinfo,
> +	xapp_xrandr, xcb-proto, xdriver_xf86-video-intel, xenomai,
> +	xkeyboard-config, xl2tp, xlib_lib{FS,SM,X11},
> +	xlib_libX{au,aw,composite,cursor,damage,ext,fixes,font,i},
> +	xlib_libX{inerama,mu,pm,randr,render,res,t,tst,v,xf86dga},
> +	xlib_libXxf86vm, xlib_libdmx, xlib_libfontenc,
> +	xlib_libpciaccess, xlib_xtrans, xproto_dri2proto,
> +	xproto_{glproto,inputproto,presentproto,randrproto,videoproto},
> +	xproto_xextproto, xproto_xproto, xutil_util-macros,
> +	xutil_makedepend, zic, zmqpp, zxing, zsh, zyre
> +
> +	New packages: apitrace, avrdude, c-ares, ca-certificates,
> +	cwiid, dbus-cpp, evemu, fping, fswebcam, gpm, gst1-libav,
> +	haveged, jasper, joe, ktap, lbreakout2, libass, libbluray,
> +	libcdio, libenca, libevdev, libmbim, libmodplug, libnfs,
> +	libnftnl, libplist, libshairplay, libsocketcan, ljsyscall,
> +	log4cplus, ltris, luainterpreter, minidlna, mmc-utils,
> +	modemmanager, mtr, net-tools, python-configobj, python-dialog,
> +	python-json-schema-validator, python-keyring, python-msgpack,
> +	python-posix-ipc, python-pyasn, python-pycrypto,
> +	python-pysnmp, python-pysnmp-apps, python-pysnmp-mibs,
> +	python-pyusb, python-simplejson, python-tornado,
> +	python-versiontools, rtmpdump, rtptools, smcroute, smstools3,
> +	tcpreplay, thrift, ti-uim, tinyxml, tmux, vlc, wmctrl,
> +	xconsole
> +
> +	Removed packages: lzma, netkitbase, netkittelnet, pkg-config,
> +	squashfs3, ttcp
> +
>  2013.11, Released November 30th, 2013:
>  
>  	Minor fixes.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
