From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 16:45:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-nouveau:
	bump version to 1.0.15
Message-ID: <20170429144513.22753-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash    | 8 ++++----
 .../xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index 7a0c92331..5b69e4e29 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,4 +1,4 @@
-# From https://lists.x.org/archives/xorg-announce/2017-March/002783.html
-md5 c57c89e1a3c9bc319d26f2e11c80e7fb  xf86-video-nouveau-1.0.14.tar.bz2
-sha1 6c5c46d6e0d8595b71e2a1df6879ab5d650f2097  xf86-video-nouveau-1.0.14.tar.bz2
-sha256 4ddff99b3cc49f16cdcf99f6e1c5856b6f06589ec98376cedb5754100afe31c1  xf86-video-nouveau-1.0.14.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-April/002796.html
+md5 717203cb87029cddcbccf7398f9ad8c3  xf86-video-nouveau-1.0.15.tar.bz2
+sha1 ed699a59ea509550f60019eef1e092ed0ccdea08  xf86-video-nouveau-1.0.15.tar.bz2
+sha256 aede10fd395610a328697adca3434fb14e9afbd79911d6c8545cfa2c0e541d4c  xf86-video-nouveau-1.0.15.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index 3e2d787af..e3969a264 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.14
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.15
 XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
-- 
2.11.0
