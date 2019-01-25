From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Jan 2019 15:40:40 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-intel:
 bump version
Message-ID: <20190125144019.2652281312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=252b2085a18ae171b4e0aff4b71709354d5bce91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash | 2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 469649ec30..2443dc2880 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 8a008db80964700c57db407fe9fab78884d6919bd5343a269f681625132b4687  xdriver_xf86-video-intel-3d395062ce73f85e8340218df01c2ebf4bc25023.tar.gz
+sha256 685a1b3e1b486f4fb02dd14adc33b8ce215bb96ed8e26787ee8b7bda4c0d6cce  xdriver_xf86-video-intel-33ee0c3b21ea279e08d0863fcb2e874f0974b00e.tar.gz
 sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 66b0f9defe..bd315c8d9a 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 3d395062ce73f85e8340218df01c2ebf4bc25023
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 33ee0c3b21ea279e08d0863fcb2e874f0974b00e
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
