From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Apr 2018 21:13:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-intel:
 bump version
Message-ID: <20180410191326.19938-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added tarball and license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash | 3 +++
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
new file mode 100644
index 0000000000..1852540cb3
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 e3a107fadcdeef35830a12a305b09dfa793a33a54930a0ecd5e84a6156f546eb  xdriver_xf86-video-intel-84eaaba2737b2765f3fe843a138002ad0056a52b.tar.gz
+sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 6debdd0964..fa0f650dbe 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = b57abe20e81f4b8e4dd203b6a9eda7ff441bc8ce
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 84eaaba2737b2765f3fe843a138002ad0056a52b
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-- 
2.14.2
