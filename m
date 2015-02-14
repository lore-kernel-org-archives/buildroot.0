From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:36:30 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-video-savage: bump version
Message-ID: <20150214143823.DE79780172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35a3259831d79e24edfff9c9c4eb6fdd1fc2d030
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use git snapshot for compatibility with xorg xserver 1.17.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-video-savage.mk                   |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 2b2ef55..676ffed 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.7
-XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = d28cd83c7b0b4a943efbe5ddf257c8ee2646ea73
+XDRIVER_XF86_VIDEO_SAVAGE_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-savage
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
