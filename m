From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 22:34:11 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	development
Message-ID: <20100927203433.709848B6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=edfb1264efa075c1cf59e7a0f9ca626e799af54d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add changes from no-install-strip branch and add #2563.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   39 +++++++++++++++++++++++++++------------
 1 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8677189..375a8f7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,20 +20,34 @@
 
 	New packages: xz
 
-	Updated/fixed packages: alsa-lib, at, avahi, axel, berkeleydb,
-	bind, bmon, boa, bridge-utils, bsdiff, busybox, dbus, dmraid,
+	Updated/fixed packages: alsa-lib, argus, at, autoconf,
+	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
+	bootutils, bridge-utils, bsdiff, busybox, dbus, dmraid,
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
-	freetype, gawk, gvfs, haserl, hostapd, hwdata, ifplugd, iperf,
-	iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
-	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
-	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
-	libxslt, lighttpd, lite, logrotate, m4, mdadm, metacity,
+	ffmpeg, freetype, gamin, gawk, gperf, gtk2-themes, gtkperf,
+	gvfs, haserl, hostapd, hwdata, ifplugd, iperf, iproute2,
+	iptables, jpeg, kexec, kismet, less, libcgi, libcurl, libdnet,
+	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
+	liboil, libpcap, libpng, libtool, libungif, libxml2, libxslt,
+	lighttpd, lite, logrotate, m4, mdadm, mesa3d, metacity,
 	mtd-utils, mysql_client, nano, nbd, ncftp, neon, netperf,
-	ntfsprogs, ntp, openntpd, openssh, openvpn, oprofile, pango,
-	pcre, php, prboom, radvd, qt, samba, sdl_mixer, sdl_sound,
-	shared-mime-info, speex, sqlite, squashfs, strace, taglib,
-	tcpdump, thttpd, tiff, tn5250, udev, udpcast, usbmount,
-	usbutils, vsftpd, which, xlib_libX11, zlib
+	netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd, openssh,
+	openvpn, oprofile, pango, patch, pcre, php, pkg-config,
+	prboom, radvd, rdesktop, ruby, qt, samba, sawman, sdl_mixer,
+	sdl_sound, setserial, shared-mime-info, speex, sqlite,
+	squashfs, strace, sylpheed, taglib, tcpdump, thttpd, tiff,
+	tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
+	which, wpa_supplicant,
+	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
+	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
+	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
+	xdriver-xf86-video-{geode,glide,glint,i128,i740,intel,mach64},
+	xdriver-xf86-video-{mga,neomagic,newport,nv,openchrome,r128},
+	xdriver-xf86-video-{rendition,s3,s3virge,savage,siliconmotion},
+	xdriver-xf86-video-{sis,sisusb,suncg3,suncg6,suncg14,sunffb},
+	xdriver-xf86-video-{sunleo,suntcx,tdfx,tga,trident,v4l,vesa},
+	xdriver-xf86-video-{vmware,voodeo,wsfb,xgi,xgixp},
+	xkeyboard-config, xlib_libX11, xstroke, xvkbd, zlib
 
 	Deprecated packages: hotplug, lzma
 
@@ -43,6 +57,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#2521: Can't compile sdl_mixer, mikmod.h can't be found
+	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
 
 2010.08: Released August 31th, 2010:
-- 
1.7.1
