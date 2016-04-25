From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:18:54 +0200
Subject: [Buildroot] [PATCH v2 1/1]
	package/x11r7/xdriver_xf86-video-openchrome: bump version to 0.4.0
Message-ID: <1461586734-21181-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: fix typo in subject

 package/x11r7/xdriver_xf86-video-openchrome/Config.in                 | 2 ++
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash  | 4 ++--
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk    | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/Config.in b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
index db27eef..e2bb6c4 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/Config.in
+++ b/package/x11r7/xdriver_xf86-video-openchrome/Config.in
@@ -15,5 +15,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_OPENCHROME
 	  Openchrome, A free and Open Source video driver for the VIA/S3G
 	  UniChrome and UniChrome Pro graphics chipsets.
 
+	  https://www.freedesktop.org/wiki/Openchrome/
+
 comment "xf86-video-openchrome needs mesa3d"
 	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index cb6617f..b3aef58 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-May/002220.html
-sha1	1f7b23d4ed53417eda5c6730486b36812f469295	xf86-video-openchrome-0.3.3.tar.bz2
+# Locally computed
+sha256	73e7966d01d0d644d3b9204e8bfc106cb99069c58e981626e7352f2693e3e927	xf86-video-openchrome-0.4.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 345beb1..83c12b2 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.3.3
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.4.0
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE = MIT
-- 
2.8.0.rc3
