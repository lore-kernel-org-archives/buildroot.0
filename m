From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:49 +0100
Subject: [Buildroot] [PATCH 23/31] package/x11r7/xdriver_xf86-video-intel:
 bump version
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-23-bernd.kuhls@t-online.de>
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
index 2443dc2880..fead7a35ff 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 685a1b3e1b486f4fb02dd14adc33b8ce215bb96ed8e26787ee8b7bda4c0d6cce  xdriver_xf86-video-intel-33ee0c3b21ea279e08d0863fcb2e874f0974b00e.tar.gz
+sha256 ed98b13673e7f75918e6c338885e60e305ecb9a3559ef98459c888baedcb2465  xdriver_xf86-video-intel-6afed33b2d673d88674f0c76efe500ae414e8e1b.tar.gz
 sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index bd315c8d9a..3ae4554d57 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 33ee0c3b21ea279e08d0863fcb2e874f0974b00e
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 6afed33b2d673d88674f0c76efe500ae414e8e1b
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
-- 
2.20.1
