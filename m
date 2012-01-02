From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 23:34:49 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120102223526.A63638FF94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a01db91eb17219f397cfa28906324b48928d6712
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   29 ++++++++++++++++++-----------
 1 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/CHANGES b/CHANGES
index 515e3db..1dc1f36 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,19 +8,26 @@
 
 	defconfigs: qemu configs for x86-64 and sparc.
 
-	uClibc: remove 0.9.30, backport unshare() support.
+	uClibc: remove 0.9.30, backport unshare() support, add
+	0.9.32.1.
 
-	Updated/fixed packages: barebox, bash, binutils, bison,
-	coreutils, dbus-glib, diffutils, dropbear, ebtables, ffmpeg,
-	flex, fluxbox, gawk, grep, gst-dsp, gst-ffmpeg, htop,
-	i2c-tools, iproute2, ipset, iw, lame, libcgi, libeXosip2,
-	libffi, libgpg-error, libgtk2, libroxml, m4,
-	module-init-tools, mpd, mtd-utils, nano, nbd, netsnmp, opencv,
-	pcre, proftpd, ruby, sqlite, squid, u-boot, usbmount, vsftpd,
-	wpa_supplicant, xdm, xf86-video-sis
+	Bootloaders: U-Boot: add 2011.12, remove 2010.xx versions.
 
-	New packages: connman, gliblib, feh, imlib2, transmission,
-	xinput-calibrator
+	Updated/fixed packages: barebox, bash, beecrypt, binutils,
+	bison, busybox, cdrkit, coreutils, dbus-glib, diffutils,
+	dropbear, ebtables, ethtool, ffmpeg, flex, fluxbox, gawk,
+	grep, gst-dsp, gst-ffmpeg, hostapd, htop, i2c-tools, iproute2,
+	ipset, iw, kismet, lame, libcap, libcgi, libeXosip2, libffi,
+	libgpg-error, libgtk2, libnl, libosip, libroxml, lighttpd, m4,
+	module-init-tools, mpd, mtd-utils, nano, nbd, netsnmp, opencv,
+	pcre, proftpd, ruby, samba, sqlite, squid, ti-utils, uboot,
+	uboot-tools, usbmount, valgrind, vsftpd, wpa_supplicant,
+	xapp_xman, xdm, xf86-video-sis
+
+	New packages: connman, explorercanvas, feh, flot, giblib,
+	igh-ethercat, imlib2, jquery, jquery-sparklines,
+	jquery-validation, jsmin, libesmtp, libmbus, NetworkManager,
+	rt-tests, transmission, xinput-calibrator
 
 	Issues resolved (http://bugs.uclibc.org):
 
