From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jun 2018 23:07:01 +0200
Subject: [Buildroot] [PATCH v2 17/22]
 package/x11r7/xdriver_xf86-video-vmware: bump version to 13.3.0
In-Reply-To: <20180623210706.2519-1-bernd.kuhls@t-online.de>
References: <20180623210706.2519-1-bernd.kuhls@t-online.de>
Message-ID: <20180623210706.2519-18-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash and all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-vmware.hash                       | 9 +++++++--
 .../xdriver_xf86-video-vmware.mk                         | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
index 8d948a7d4c..f07e061478 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2016-November/002743.html
-sha256 e2f7f7101fba7f53b268e7a25908babbf155b3984fb5268b3d244eb6c11bf62b  xf86-video-vmware-13.2.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-May/002895.html
+md5 08d66d062055080ff699ab4869726ea2  xf86-video-vmware-13.3.0.tar.bz2
+sha1 f01335fe6bdb507e749571bfcd69163aed97312a  xf86-video-vmware-13.3.0.tar.bz2
+sha256 47971924659e51666a757269ad941a059ef5afe7a47b5101c174a6022ac4066c  xf86-video-vmware-13.3.0.tar.bz2
+sha512 c318de893cae7b2b11e11c1b389ee47478b7c8d1f52c27099dbe453efec28f3e9da449217307a8c2251999eada66312f766996be1a6ead413b8b6dedc42c68ca  xf86-video-vmware-13.3.0.tar.bz2
+# Locally computed
+sha256 7e59b8ca2a161855a60561f27ada8dfdbb678733eacdb23423fff6d21f9ad43b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
index 3ba6b332a3..5f0cb77bf8 100644
--- a/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
+++ b/package/x11r7/xdriver_xf86-video-vmware/xdriver_xf86-video-vmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.2.1
+XDRIVER_XF86_VIDEO_VMWARE_VERSION = 13.3.0
 XDRIVER_XF86_VIDEO_VMWARE_SOURCE = xf86-video-vmware-$(XDRIVER_XF86_VIDEO_VMWARE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VMWARE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VMWARE_LICENSE = MIT
-- 
2.17.1
