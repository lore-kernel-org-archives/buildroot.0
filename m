From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 28 Jul 2016 20:05:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
	bump version
Message-ID: <1469729121-557-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
The last bump in buildroot dates back Dec 2015, still no new release
upstream but this version finally works for on my system after bumping
from 2.99.911 ;)

 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index bf4f7a6..64e9269 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 82293901da23d79fd074e5255fda5c95405d52de
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 6988b873b041130d88dd0aae70c10f86550ee2b3
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-- 
2.8.1
