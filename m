From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 22:08:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-sis: bump
 version to 0.12.0
Message-ID: <20200104210828.592485-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash | 10 +++++-----
 .../xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
index bcce6d4740..f670952702 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003016.html
-md5 b4ad0e572bffa609f75df787ea7b3d11  xf86-video-sis-0.11.0.tar.bz2
-sha1 3e6b22a1c8061fb7efc7bf7012ca47fbf9f64722  xf86-video-sis-0.11.0.tar.bz2
-sha256 2177901a21a980552f8be429f063388e4c5d5f2e24e8b0ce72d65bd93ccc3b6b  xf86-video-sis-0.11.0.tar.bz2
-sha512 b8ad05b3faa24c6df65d825b576ddb8e2ce44705ce8b55d8cf0d9f37aa47a429ab43765d8daea57ff35c4cffed056fbec6dfe8ce95efcd6269cc7711115ea09c  xf86-video-sis-0.11.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-December/003033.html
+md5  b8ec9c21758043b1480f11baec296f5d  xf86-video-sis-0.12.0.tar.bz2
+sha1 d22f0d0081e222a62f9e788f5e73246c6d339f80  xf86-video-sis-0.12.0.tar.bz2
+sha256 119d3f17d53c862ec4bf891ed696a6f1d32cdf8bd11d944a9f0ad24625333a5b  xf86-video-sis-0.12.0.tar.bz2
+sha512 5aa101e5217f15667f2c94f7a76f4afcf47717b61f5d206ce65efe35dc3f674ca294f98ca8586971c6467f31decdd94d8255ebfc7dc220fac0179afc61995952  xf86-video-sis-0.12.0.tar.bz2
 # Locally computed
 sha256 e7958f9497a4daa3ae5aeaf885e4565520af2c540b6e4e04b52bf95d41d56c39  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 7a43d26553..f96b0a9d0e 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0.11.0
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.12.0
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
-- 
2.20.1
