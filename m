From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:56:04 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-intel:
 bump version
Message-ID: <20180710215810.A399088315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47fb4c5de5508d94c871e7fe91047c6b3df53f5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version bump includes

https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/commit/?id=359477215092ac1b602ad1e2f17a28963d9224c2

which is needed for compatibility with upcoming xserver_xorg-server
1.20.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash | 2 +-
 package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
index 1852540cb3..469649ec30 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e3a107fadcdeef35830a12a305b09dfa793a33a54930a0ecd5e84a6156f546eb  xdriver_xf86-video-intel-84eaaba2737b2765f3fe843a138002ad0056a52b.tar.gz
+sha256 8a008db80964700c57db407fe9fab78884d6919bd5343a269f681625132b4687  xdriver_xf86-video-intel-3d395062ce73f85e8340218df01c2ebf4bc25023.tar.gz
 sha256 5808e89f4b9a30afc59f335bfa8219ecf2dacb89a81d16b322bc6d92993a48fa  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index fa0f650dbe..db96c9f6f8 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 84eaaba2737b2765f3fe843a138002ad0056a52b
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 3d395062ce73f85e8340218df01c2ebf4bc25023
 XDRIVER_XF86_VIDEO_INTEL_SITE = git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
 XDRIVER_XF86_VIDEO_INTEL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_INTEL_LICENSE_FILES = COPYING
