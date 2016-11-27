From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Nov 2016 12:06:10 +0100
Subject: [Buildroot] [PATCH/next 07/13]
	package/x11r7/xdriver_xf86-video-openchrome: bump version to 0.5.0
In-Reply-To: <20161127110616.3451-1-bernd.kuhls@t-online.de>
References: <20161127110616.3451-1-bernd.kuhls@t-online.de>
Message-ID: <20161127110616.3451-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash  | 4 ++--
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
index b3aef58..2d29fae 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256	73e7966d01d0d644d3b9204e8bfc106cb99069c58e981626e7352f2693e3e927	xf86-video-openchrome-0.4.0.tar.bz2
+# From https://lists.freedesktop.org/archives/openchrome-devel/2016-July/002890.html
+sha1 9c7ad349de6dd350252ccda8da56fa1e2a6afa32  xf86-video-openchrome-0.5.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 83c12b2..9ab032b 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.4.0
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.5.0
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE = MIT
-- 
2.10.2
