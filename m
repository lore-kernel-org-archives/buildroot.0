From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with changes
	from various-bumps branch
Message-ID: <20100727210248.4BF12835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=18fa12fe14b1aca9aed313906bbc906ee703ec6e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   28 ++++++++++++++++------------
 1 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d3d32b..def806b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -18,22 +18,23 @@
 	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
-	Updated/fixed packages: alsa-lib, alsamixergui, at, avahi,
-	berkeleydb, bash, blackbox, busybox, bzip2, cdrkit, cmake,
-	dash, dhcp, dialog, diffutils, distcc, dmalloc, dnsmasq,
-	dropbear, e2fsprogs, fbv, file, flex, fontconfig, gawk, gmpc,
-	gnuchess, gst-plugins-base, gst-plugins-good, gstreamer, gzip,
-	intltool, ipsec-tools, iptables, iw, libart, libcgi, libdrm,
-	libfuse, libgpg-error, libidn, liblockfile, libpng, lighttpd,
-	links, linux-fusion, lmbench, lrzsz, ltrace, make,
+	Updated/fixed packages: alsa-lib, alsamixergui, at, atk,
+	avahi, berkeleydb, bash, blackbox, busybox, bzip2, cairo,
+	cdrkit, cmake, dash, dhcp, dialog, diffutils, distcc, dmalloc,
+	dnsmasq, dropbear, e2fsprogs, fbv, file, flex, fontconfig,
+	gawk, gmpc, gnuchess, gst-plugins-base, gst-plugins-good,
+	gstreamer, gzip, icu, intltool, ipsec-tools, iptables, iw,
+	libart, libcgi, libdrm, libfuse, libglib2, libgpg-error,
+	libidn, liblockfile, libpng, libsoup, lighttpd, links,
+	linux-fusion, lmbench, lrzsz, ltrace, make, midori,
 	module-init-tools, mplayer, mysql_client, nbd, ncurses, neon,
-	netcat, netperf, ntfsprogs, openssl, php, qt, quagga,
+	netcat, netperf, ntfsprogs, openssl, pango, php, qt, quagga,
 	setserial, sdl, sdl_mixer, sdl_sound, sdl_ttf, sqlite,
 	squashfs, swfdec, tftpd, thttpd, tn5250, tremor, usbutils,
-	webif, wireless_tools, xkeyboard-config, xserver_xorg-server,
-	xvkbd
+	webif, webkit, wireless_tools, xkeyboard-config,
+	xserver_xorg-server, xvkbd
 
-	Removed packages: modutils, portage, rxvt
+	Removed packages: libgail, modutils, portage, rxvt
 
 	Deprecated packages: dillo, libglib12, libgtk12, microwin, pcmcia
 
@@ -46,9 +47,12 @@
 	#475:  uImage target for U-boot failed generating
 	#583:  build fails with external x86_64 toolchain
 	#729:  sstrip creates corrupted headers
+	#829:  Webkit r44552 needs libXt
 	#835:  Package Dataflashboot-1.05 does not compile with buildroot...
+	#1051: Webkit doesn't compile (Linuxthreads new, x86)
 	#1213: Move .config into output directory
 	#1393: neon config fails libxml/parser.h: libxml2 requires, but not ...
+	#1405: WebKit fails to build because pthread_getattr_np is not impl...
 	#1753: lmbench: convert to generic package infrastructure
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1807: LZMA 4.32.7, Required header file(s) are missing
-- 
1.7.1
