From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 23 Nov 2009 13:03:59 +0100
Subject: [Buildroot] [git commit master] gqview: needs libgtk2
Message-ID: <20091123120650.4D04177782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27ab47c473465801a681d7a1a5e3ac14203dfe94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |   14 +++++++-------
 package/gqview/Config.in |    1 +
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 203124d..b9870f6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,13 +21,13 @@
 	sdl_sound, swfdec, sysstat
 
 	Updated/fixed packages: alsamixergui, autoconf, bootutils, busybox,
-	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gperf, gstreamer,
-	gst-plugins-bad, gst-plugins-base, gst-plugins-good, imagemagick,
-	ipkg, iptables, iw, kernel-headers, kismet, libelf, libevent, libglib2,
-	libidn, liblockfile, libmad, libpcap, libupnp, libuuid, lighttpd,
-	ltrace, lua, lzma, magiccube4d, matchbox, mdadm, nbd, ncftp, ncurses,
-	netkittelnet, netsnmp, ntfs-3g, openntp, openssl, pcmanfm, php,
-	python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
+	gcc, directfb, dnsmasq, e2fsprogs, festival, gamin, gperf, gqview,
+	gstreamer, gst-plugins-bad, gst-plugins-base, gst-plugins-good,
+	imagemagick, ipkg, iptables, iw, kernel-headers, kismet, libelf,
+	libevent, libglib2, libidn, liblockfile, libmad, libpcap, libupnp,
+	libuuid, lighttpd, ltrace, lua, lzma, magiccube4d, matchbox, mdadm,
+	nbd, ncftp, ncurses, netkittelnet, netsnmp, ntfs-3g, openntp, openssl,
+	pcmanfm, php, python, quagga, radvd, rsync, rubix, samba, sawman, sdl,
 	shared-mime-info, spawn-fcgi, speech-tools, sqlite, squashfs, synergy,
 	syslinux, target-binutils, tcpdump, u-boot, util-linux, valgrind,
 	vsftpd, wipe, wpa-supplicant, xdata_xcursor-themes, xboard, xstroke,
diff --git a/package/gqview/Config.in b/package/gqview/Config.in
index 6d06258..c1df40c 100644
--- a/package/gqview/Config.in
+++ b/package/gqview/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GQVIEW
 	bool "gqview"
+	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  GQview is an image viewer for Unix operating systems
 
-- 
1.6.3.3
