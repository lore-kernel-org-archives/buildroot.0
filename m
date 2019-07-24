From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 Jul 2019 20:26:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-video-intel:
 bump version
Message-ID: <20190724182654.18056-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash      | 2 +-
 .../x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index fead7a35ff..d081a31c42 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ed98b13673e7f75918e6c338885e60e305ecb9a3559ef98459c888baedcb2465  xdriver_xf86-video-intel-6afed33b2d673d88674f0c76efe500ae414e8e1b.tar.gz
+sha256 861e0bd7a41bcb4d736d6a84dc58c8cc3e2ca7184b1419271beef95855b22315  xdriver_xf86-video-intel-6f4972d5c368c30e971a23c1dc370d3e43761282.tar.gz
 sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 3ae4554d57..9efe8e1bcc 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 6afed33b2d673d88674f0c76efe500ae414e8e1b
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 6f4972d5c368c30e971a23c1dc370d3e43761282
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-- 
2.20.1
