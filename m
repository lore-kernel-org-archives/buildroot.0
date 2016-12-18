From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Dec 2016 14:04:18 +0100
Subject: [Buildroot] [PATCH 2/4] package/x11r7/xdriver_xf86-video-dummy:
	bump version to 0.3.8
In-Reply-To: <20161218130420.3920-1-bernd.kuhls@t-online.de>
References: <20161218130420.3920-1-bernd.kuhls@t-online.de>
Message-ID: <20161218130420.3920-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash | 4 ++--
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
index 31cba2cb4..f26ddd4b5 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2013-September/002318.html
-sha256	56f84fcbc515685529ad8e10bca1072731d9c096b97c5d35ddc95cd589b98680	xf86-video-dummy-0.3.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-December/002751.html
+sha256 3712bb869307233491e4c570732d6073c0dc3d99adfdb9977396a3fdf84e95b9  xf86-video-dummy-0.3.8.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
index 58d9925f3..fff1495ef 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.7
+XDRIVER_XF86_VIDEO_DUMMY_VERSION = 0.3.8
 XDRIVER_XF86_VIDEO_DUMMY_SOURCE = xf86-video-dummy-$(XDRIVER_XF86_VIDEO_DUMMY_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_DUMMY_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_DUMMY_LICENSE = MIT
-- 
2.11.0
