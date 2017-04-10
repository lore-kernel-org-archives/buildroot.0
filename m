From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 20:18:18 +0200
Subject: [Buildroot] [PATCH 4/4] package/x11r7/xdriver_xf86-video-intel:
	bump version
In-Reply-To: <20170410181818.3142-1-bernd.kuhls@t-online.de>
References: <20170410181818.3142-1-bernd.kuhls@t-online.de>
Message-ID: <20170410181818.3142-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed option --disable-glamor, it was removed in 2014:
https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/configure.ac?id=0aa2edbd29c8dd26a5f3748e3875c445ea358a6d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 29228bbf77..6debdd0964 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 9ac7a3370ab265d4cbdbbf3dc588af88c37048e1
+XDRIVER_XF86_VIDEO_INTEL_VERSION = b57abe20e81f4b8e4dd203b6a9eda7ff441bc8ce
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
@@ -19,7 +19,6 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_ENV = \
 XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--disable-xvmc \
 	--enable-sna \
-	--disable-glamor \
 	--disable-xaa \
 	--disable-dga \
 	--disable-async-swap
-- 
2.11.0
