From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libSM to 1.1.1
Message-ID: <20100308133652.1629A776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3374d4f9652a7fb03e75bb7aef914b47fa4548ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libSM/Config.in     |    2 +-
 package/x11r7/xlib_libSM/xlib_libSM.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libSM/Config.in b/package/x11r7/xlib_libSM/Config.in
index 217e0e3..0267335 100644
--- a/package/x11r7/xlib_libSM/Config.in
+++ b/package/x11r7/xlib_libSM/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBSM
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libSM 1.0.2
+	  libSM 1.1.1
 	  X.Org SM library
diff --git a/package/x11r7/xlib_libSM/xlib_libSM.mk b/package/x11r7/xlib_libSM/xlib_libSM.mk
index 70df5f0..5aeb42d 100644
--- a/package/x11r7/xlib_libSM/xlib_libSM.mk
+++ b/package/x11r7/xlib_libSM/xlib_libSM.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBSM_VERSION = 1.1.0
+XLIB_LIBSM_VERSION = 1.1.1
 XLIB_LIBSM_SOURCE = libSM-$(XLIB_LIBSM_VERSION).tar.bz2
 XLIB_LIBSM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBSM_AUTORECONF = NO
-- 
1.6.3.3
