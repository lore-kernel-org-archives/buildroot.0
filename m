From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Sep 2016 15:35:57 +0200
Subject: [Buildroot] [PATCH 3/6] package/x11r7/xdriver_xf86-video-ati: bump
	version to 7.7.1
In-Reply-To: <20160925133600.12316-1-bernd.kuhls@t-online.de>
References: <20160925133600.12316-1-bernd.kuhls@t-online.de>
Message-ID: <20160925133600.12316-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
index 6eb3508..469e057 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.hash
@@ -1,2 +1,2 @@
-# From https://lists.x.org/archives/xorg-announce/2016-April/002684.html
-sha256	844d1c577b145c90dc8ef027678f0c27f554363f782cd696a3aea26415b2c1c3	xf86-video-ati-7.7.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-September/002707.html
+sha256 00a58588db62ee309095c5c5920bbd248d965e8627f88affe68a73b18865078d  xf86-video-ati-7.7.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 29a0d2f..02a457b 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 7.7.0
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.7.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
2.9.3
