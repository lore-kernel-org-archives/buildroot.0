From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Mar 2015 12:19:17 +0100
Subject: [Buildroot] [PATCH 08/14] package/x11r7/xdriver_xf86-video-tdfx:
	bump version to 1.4.6, add hash
In-Reply-To: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426418363-22738-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1426418363-22738-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash    |    2 ++
 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk  |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
new file mode 100644
index 0000000..1cdef2a
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-February/002536.html
+sha256	3a8a88867c40ad61f1c9a09ffd7ac64102fa821685855d50ce66c7603dcc6d37	xf86-video-tdfx-1.4.6.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 745fd2d..4d0ba60 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 2f71b05e29ae13a0fb6fbc74f4f76c78b6ddb0d7
-XDRIVER_XF86_VIDEO_TDFX_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-tdfx
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.6
+XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
 XDRIVER_XF86_VIDEO_TDFX_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
-- 
1.7.10.4
