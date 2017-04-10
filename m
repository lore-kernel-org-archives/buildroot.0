From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 20:18:17 +0200
Subject: [Buildroot] [PATCH 3/4] package/x11r7/xdriver_xf86-video-nouveau:
	bump version to 1.0.14
In-Reply-To: <20170410181818.3142-1-bernd.kuhls@t-online.de>
References: <20170410181818.3142-1-bernd.kuhls@t-online.de>
Message-ID: <20170410181818.3142-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add all upstream hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash    | 8 ++++----
 .../xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index cfba3a00ba..7a0c923312 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,4 +1,4 @@
-# Locally computed
-sha256 6d9242ba139c3df7afefffb455573b52f4427920b978161c00483c64a6da47cb  xf86-video-nouveau-1.0.13.tar.bz2
-# From http://www.linuxfromscratch.org/blfs/view/svn/x/x7driver.html#xorg-nouveau-driver
-md5 2d7b2917ef18c6e97a6f3817c3e9387b  xf86-video-nouveau-1.0.13.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-March/002783.html
+md5 c57c89e1a3c9bc319d26f2e11c80e7fb  xf86-video-nouveau-1.0.14.tar.bz2
+sha1 6c5c46d6e0d8595b71e2a1df6879ab5d650f2097  xf86-video-nouveau-1.0.14.tar.bz2
+sha256 4ddff99b3cc49f16cdcf99f6e1c5856b6f06589ec98376cedb5754100afe31c1  xf86-video-nouveau-1.0.14.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index 70a7d87991..3e2d787af3 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.13
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.14
 XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
-- 
2.11.0
