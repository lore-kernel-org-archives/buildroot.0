From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] leafpad: needs libgtk2
Message-ID: <20091123120650.EDBC277782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f6cbb2687dc7f29137f72cc963f8ddbc1fbefb57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |   18 +++++++++---------
 package/leafpad/Config.in |    1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/CHANGES b/CHANGES
index b9870f6..5be5c94 100644
--- a/CHANGES
+++ b/CHANGES
@@ -23,15 +23,15 @@
 	Updated/fixed packages: alsamixergui, autoconf, bootutils, busybox,
 	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gperf, gqview,
 	gstreamer, gst-plugins-bad, gst-plugins-base, gst-plugins-good,
-	imagemagick, ipkg, iptables, iw, kernel-headers, kismet, libelf,
-	libevent, libglib2, libidn, liblockfile, libmad, libpcap, libupnp,
-	libuuid, lighttpd, ltrace, lua, lzma, magiccube4d, matchbox, mdadm,
-	nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl,
-	pcmanfm, php, python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
-	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
-	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
-	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard, xstroke,
-	zlib
+	imagemagick, ipkg, iptables, iw, kernel-headers, kismet, leafpad,
+	libelf, libevent, libglib2, libidn, liblockfile, libmad, libpcap,
+	libupnp, libuuid, lighttpd, ltrace, lua, lzma, magiccube4d, matchbox,
+	mdadm, nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp,
+	openssl, pcmanfm, php, python, quagga, radvd, rsync, rubix, samba,
+	sawman, sdl, shared-mime-info, spawn-fcgi, speech-tools, sqlite,
+	squashfs, synergy, syslinux, target-binutils, tcpdump, u-boot,
+	util-linux, valgrind, vsftpd, wipe, wpa-supplicant,
+	xdata_xcursor-themes, xboard, xstroke, zlib
 
 	Removed package: mdnsresponder, mpatrol, gcc 3.4.6 + 4.0.4, vice
 
diff --git a/package/leafpad/Config.in b/package/leafpad/Config.in
index f748ffc..a440854 100644
--- a/package/leafpad/Config.in
+++ b/package/leafpad/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LEAFPAD
 	bool "leafpad"
+	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  GTK+ based simple text editor
 
-- 
1.6.3.3
