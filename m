From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:37:22 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-video-mga: bump version
Message-ID: <20150214143824.244FB80172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47e43a529b7961c9fa70e6f5bdc43beac54fc5e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use git snapshot for compatibility with xorg xserver 1.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-mga.mk                      |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index b530394..b800fcf 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 1.6.3
-XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_MGA_VERSION = 132dee029e36c9a91a85f178885e94a9f9b5ee37
+XDRIVER_XF86_VIDEO_MGA_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-mga
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
 XDRIVER_XF86_VIDEO_MGA_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MGA_AUTORECONF = YES
