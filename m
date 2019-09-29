From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Sep 2019 20:20:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-nouveau:
 bump version to 1.0.16
Message-ID: <20190929182050.27218-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-nouveau.hash                   | 11 +++++++----
 .../xdriver_xf86-video-nouveau.mk                     |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index 5b69e4e297..b70728f9b7 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,4 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-April/002796.html
-md5 717203cb87029cddcbccf7398f9ad8c3  xf86-video-nouveau-1.0.15.tar.bz2
-sha1 ed699a59ea509550f60019eef1e092ed0ccdea08  xf86-video-nouveau-1.0.15.tar.bz2
-sha256 aede10fd395610a328697adca3434fb14e9afbd79911d6c8545cfa2c0e541d4c  xf86-video-nouveau-1.0.15.tar.bz2
+# From https://lists.freedesktop.org/archives/nouveau/2019-January/032053.html
+md5 ecd9be89d853301167e3d564c49f7a8e  xf86-video-nouveau-1.0.16.tar.bz2
+sha1 a2d19439ceed315079207a62c6888a12e8489995  xf86-video-nouveau-1.0.16.tar.bz2
+sha256 304060806415579cdb5c1f71f1c54d11cacb431b5552b170decbc883ed43bf06  xf86-video-nouveau-1.0.16.tar.bz2
+sha512 41b7839c37372660968ab7da2bc3d9feef3cab4e994d05d4ba6e59071f0d1b1f8d7dcdbcb15a42a375a556d28dc067f9ffe45d73c1d121ad307d199107ade3e0  xf86-video-nouveau-1.0.16.tar.bz2
+# Locally computed
+sha256 27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index 41b6fd6d42..d85cbfe4a4 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.15
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.16
 XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
-- 
2.20.1
