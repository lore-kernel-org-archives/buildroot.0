From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 12:58:08 +0100
Subject: [Buildroot] [PATCH v2 4/5] package/x11r7/xdriver_xf86-video-intel:
	bump version to fix crash with xserver_xorg-server 1.19.x
In-Reply-To: <20161203115809.25297-1-bernd.kuhls@t-online.de>
References: <20161203115809.25297-1-bernd.kuhls@t-online.de>
Message-ID: <20161203115809.25297-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial version

 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index bfe0527..29228bb 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 6988b873b041130d88dd0aae70c10f86550ee2b3
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 9ac7a3370ab265d4cbdbbf3dc588af88c37048e1
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-- 
2.10.2
