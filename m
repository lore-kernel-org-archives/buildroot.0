From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  1 Jul 2021 20:26:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 bump version
Message-ID: <20210701182627.306036-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add --disable-tools for reproducable builds.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash     | 2 +-
 .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 4e41bda154..26002a7966 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e121871de0396caff0349d761033aa4c0618d27b1ad5d79dab6c8246d9fb50d1  xdriver_xf86-video-intel-5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc-br1.tar.gz
+sha256  11f48628d2b1f495446c49df93de40569ced664c6fdbd5d3f8f7a863e4a1124c  xdriver_xf86-video-intel-31486f40f8e8f8923ca0799aea84b58799754564-br1.tar.gz
 sha256  5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index ac598cf0fb..d911234c92 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 5ca3ac1a90af177eb111a965e9b4dd8a27cc58fc
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 31486f40f8e8f8923ca0799aea84b58799754564
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
@@ -21,6 +21,7 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 	--enable-sna \
 	--disable-xaa \
 	--disable-dga \
+	--disable-tools \
 	--disable-async-swap
 
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
-- 
2.30.2
