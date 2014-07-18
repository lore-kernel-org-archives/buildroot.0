From: Ben Widawsky <ben@bwidawsk.net>
Date: Thu, 17 Jul 2014 22:27:29 -0700
Subject: [Buildroot] [PATCH 2/2] xf86-video-intel: Bump version to 2.99.912
In-Reply-To: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
References: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
Message-ID: <1405661249-6506-2-git-send-email-ben@bwidawsk.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning: I've only built this. Not run it.

Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ben Widawsky <ben@bwidawsk.net>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 787b8fa..82e6965 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.912
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
-- 
2.0.1
