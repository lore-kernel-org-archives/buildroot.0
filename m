From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 8 Mar 2014 14:36:56 +0100
Subject: [Buildroot] [PATCH v3 4/4] xdriver_xf86-video-intel: Bump version
	to 2.99.910
In-Reply-To: <1394285816-7111-1-git-send-email-berndkuhls@hotmail.com>
References: <1394285816-7111-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP238CFC6C30AB443948075EED98A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
v3: bump version to 2.99.910
v2: bump version to 2.99.909
v1: bump version to 2.99.908

 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..67eb332 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.910
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
-- 
1.7.10.4
