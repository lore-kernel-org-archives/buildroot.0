From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:55:56 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-intel:
 bump version
Message-ID: <20200105205311.E94928ECBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c907b15549728f44f3ebc3d964d3018efcd35af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash | 2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index d081a31c42..ff816c7bbe 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 861e0bd7a41bcb4d736d6a84dc58c8cc3e2ca7184b1419271beef95855b22315  xdriver_xf86-video-intel-6f4972d5c368c30e971a23c1dc370d3e43761282.tar.gz
+sha256 b074366aad25cae38bb455792ac3110d52bcb0e4a183766c37ee12cbe56d7f8c  xdriver_xf86-video-intel-f66d39544bb8339130c96d282a80f87ca1606caf.tar.gz
 sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 9efe8e1bcc..fb74eb6ad5 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 6f4972d5c368c30e971a23c1dc370d3e43761282
+XDRIVER_XF86_VIDEO_INTEL_VERSION = f66d39544bb8339130c96d282a80f87ca1606caf
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
