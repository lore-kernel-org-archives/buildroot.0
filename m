From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:10:43 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-intel:
	bump version to fix crash with xserver_xorg-server 1.19.x
Message-ID: <20161204151119.BE09481D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad916feecbac191b22e9766875691d88e9d9100e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
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
