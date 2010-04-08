From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] pthread-stubs: bump version
Message-ID: <20100408201138.7536A8B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7e391f16228a2b05c173b542c4ff8c9fbf1c9c90
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    4 ++--
 package/x11r7/pthread-stubs/pthread-stubs.mk |    3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4886a68..1e68d4b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,8 +15,8 @@
 	e2fsprogs, fbv, freetype, iperf, iptables, iw, less, libdrm,
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
-	qt, radvd, setserial, squashfs, usb_modeswith, wget,
-	xlib_libX11, xlib_libXfont
+	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
+	wget, xlib_libX11, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/pthread-stubs/pthread-stubs.mk b/package/x11r7/pthread-stubs/pthread-stubs.mk
index b62084b..f40332a 100644
--- a/package/x11r7/pthread-stubs/pthread-stubs.mk
+++ b/package/x11r7/pthread-stubs/pthread-stubs.mk
@@ -3,10 +3,11 @@
 # pthread-stubs
 #
 #############################################################
-PTHREAD_STUBS_VERSION = 0.1
+PTHREAD_STUBS_VERSION = 0.3
 PTHREAD_STUBS_SOURCE = libpthread-stubs-$(PTHREAD_STUBS_VERSION).tar.bz2
 PTHREAD_STUBS_SITE = http://xcb.freedesktop.org/dist/
 
+PTHREAD_STUBS_LIBTOOL_PATCH = NO
 PTHREAD_STUBS_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS,package/x11r7,pthread-stubs))
-- 
1.6.3.3
