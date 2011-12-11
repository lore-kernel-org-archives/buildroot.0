From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:54:12 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20111211225425.37B958F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bde07d6edb12a686203e8be7d65a3d62a88e0da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 330ac6a..515e3db 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,8 @@
 
 	Fixes all over the tree and new features.
 
+	Toolchain: Default to GCC 4.5.x, add binutils 2.22.
+
 	Gentargets: scp and mercurial support.
 
 	defconfigs: qemu configs for x86-64 and sparc.
@@ -9,13 +11,16 @@
 	uClibc: remove 0.9.30, backport unshare() support.
 
 	Updated/fixed packages: barebox, bash, binutils, bison,
-	coreutils, dbus-glib, diffutils, dropbear, ebtables, flex,
-	fluxbox, gawk, grep, gst-dsp, htop, iproute2, iw, lame,
-	libgpg-error, libgtk2, libroxml, m4, module-init-tools,
-	mtd-utils, nano, nbd, netsnmp, ruby, u-boot, usbmount,
-	wpa_supplicant, xdm
-
-	New packages: connman, transmission
+	coreutils, dbus-glib, diffutils, dropbear, ebtables, ffmpeg,
+	flex, fluxbox, gawk, grep, gst-dsp, gst-ffmpeg, htop,
+	i2c-tools, iproute2, ipset, iw, lame, libcgi, libeXosip2,
+	libffi, libgpg-error, libgtk2, libroxml, m4,
+	module-init-tools, mpd, mtd-utils, nano, nbd, netsnmp, opencv,
+	pcre, proftpd, ruby, sqlite, squid, u-boot, usbmount, vsftpd,
+	wpa_supplicant, xdm, xf86-video-sis
+
+	New packages: connman, gliblib, feh, imlib2, transmission,
+	xinput-calibrator
 
 	Issues resolved (http://bugs.uclibc.org):
 
