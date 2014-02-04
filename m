From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 4 Feb 2014 19:15:25 +0100
Subject: [Buildroot] [PATCH v2 7/7] xdriver_xf86-video-intel: Bump version
	to 2.99.909
In-Reply-To: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
References: <1391537725-15894-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP273A74B9DF705C3958534E2D9AA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..02d92bf 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.907
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.99.909
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
-- 
1.7.9.5
