From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:50 +0200
Subject: [Buildroot] [PATCH 11/15] package/x11r7/xdriver_xf86-video-mach64:
	bump version to 6.9.5
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash      |    2 ++
 .../x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk  |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
new file mode 100644
index 0000000..43a7fa7
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-May/002599.html
+sha256	3e98985b6e044189efd42342862208f472881c25debf22230a1d54a96d71b41f	xf86-video-mach64-6.9.5.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 4819937..9b438cb 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 810572536e153ac9e4615a35e2ab99dc266806da
-XDRIVER_XF86_VIDEO_MACH64_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-mach64
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.5
+XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
-- 
1.7.10.4
