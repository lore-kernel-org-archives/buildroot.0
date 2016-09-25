From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Sep 2016 15:35:58 +0200
Subject: [Buildroot] [PATCH 4/6] package/x11r7/xdriver_xf86-video-nouveau:
	bump version to 1.0.13
In-Reply-To: <20160925133600.12316-1-bernd.kuhls@t-online.de>
References: <20160925133600.12316-1-bernd.kuhls@t-online.de>
Message-ID: <20160925133600.12316-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash      | 6 ++++--
 .../x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk  | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
index 9633641..cfba3a0 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.hash
@@ -1,2 +1,4 @@
-# From http://lists.x.org/archives/xorg-announce/2015-December/002662.html
-sha256	0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e	xf86-video-nouveau-1.0.12.tar.bz2
+# Locally computed
+sha256 6d9242ba139c3df7afefffb455573b52f4427920b978161c00483c64a6da47cb  xf86-video-nouveau-1.0.13.tar.bz2
+# From http://www.linuxfromscratch.org/blfs/view/svn/x/x7driver.html#xorg-nouveau-driver
+md5 2d7b2917ef18c6e97a6f3817c3e9387b  xf86-video-nouveau-1.0.13.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
index af84e79..70a7d87 100644
--- a/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
+++ b/package/x11r7/xdriver_xf86-video-nouveau/xdriver_xf86-video-nouveau.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.12
+XDRIVER_XF86_VIDEO_NOUVEAU_VERSION = 1.0.13
 XDRIVER_XF86_VIDEO_NOUVEAU_SOURCE = xf86-video-nouveau-$(XDRIVER_XF86_VIDEO_NOUVEAU_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NOUVEAU_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NOUVEAU_LICENSE = MIT
-- 
2.9.3
