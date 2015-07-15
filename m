From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:49 +0200
Subject: [Buildroot] [PATCH 10/15]
	package/x11r7/xdriver_xf86-video-siliconmotion: bump version
	to 1.7.8
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-siliconmotion.hash                         |    2 ++
 .../xdriver_xf86-video-siliconmotion.mk                           |    5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash

diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
new file mode 100644
index 0000000..42f39d2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-May/002604.html
+sha256	e9d449a9fd9e58b4e018447b6c64005f7874cffb1777e513ac9fc41a86071beb	xf86-video-siliconmotion-1.7.8.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
index ef4fc30..37e87a5 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = c31d7f853d7469085f96f1e37923c260884c611c
-XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-siliconmotion
+XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION = 1.7.8
+XDRIVER_XF86_VIDEO_SILICONMOTION_SOURCE = xf86-video-siliconmotion-$(XDRIVER_XF86_VIDEO_SILICONMOTION_VERSION).tar.bz2
+XDRIVER_XF86_VIDEO_SILICONMOTION_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SILICONMOTION_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SILICONMOTION_AUTORECONF = YES
-- 
1.7.10.4
