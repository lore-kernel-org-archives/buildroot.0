From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] pixman: bump version
Message-ID: <20100408201137.62E5E8B352@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ff72acf78282c93a675eed81451b272e2ee828de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    7 ++++---
 package/pixman/pixman.mk |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4564aaa..12ba66e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,9 +13,10 @@
 
 	Updated/fixed packages: busybox, dnsmasq, dosfstools,
 	e2fsprogs, fbv, freetype, iperf, iptables, iw, less, libdrm,
-	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm, memstat,
-	mtd-utils, nano, openssl, php, pppd, qt, radvd, setserial,
-	squashfs, usb_modeswith, wget, xlib_libX11, xlib_libXfont
+	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
+	memstat, mtd-utils, nano, openssl, php, pixman, pppd, qt,
+	radvd, setserial, squashfs, usb_modeswith, wget, xlib_libX11,
+	xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 087ab12..8c7a233 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,7 +3,7 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.17.4
+PIXMAN_VERSION = 0.17.6
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
-- 
1.6.3.3
