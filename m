From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Jan 2019 10:35:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-neomagic:
 bump version to 1.3.0
Message-ID: <20190126093546.2883-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-neomagic.hash                     | 9 +++++++--
 .../xdriver_xf86-video-neomagic.mk                       | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
index fc830661b4..55996f5b0d 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002602.html
-sha256	72f89396b10527549337cb72a7eafb1194cf140144f9236a94ad2becdf140bf2	xf86-video-neomagic-1.2.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-December/002934.html
+md5 349d5254d09eb46f2a1f151cd423b89a  xf86-video-neomagic-1.3.0.tar.bz2
+sha1 6bccfa15ea05d5264120cd96ccf13687642e8f6d  xf86-video-neomagic-1.3.0.tar.bz2
+sha256 93833950fae7757088eb6abb125e15e8c245e5e25681c19c3ad4213ec7319064  xf86-video-neomagic-1.3.0.tar.bz2
+sha512 25d019a2556e52aeb4e25942f444437a921e76d527c10ddd420f16aa7d85bf2b8a51612c382a2a7e3e407bb1e8d610d063101184eea0889c3e1a69bfb3b37735  xf86-video-neomagic-1.3.0.tar.bz2
+# Locally computed
+sha256 95063ce9aa09850025dd317549ce688519079a8d3cf66ceb3d882cb2bafcced9  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
index 93cd55a11b..8dd2777ff9 100644
--- a/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
+++ b/package/x11r7/xdriver_xf86-video-neomagic/xdriver_xf86-video-neomagic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.2.9
+XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION = 1.3.0
 XDRIVER_XF86_VIDEO_NEOMAGIC_SOURCE = xf86-video-neomagic-$(XDRIVER_XF86_VIDEO_NEOMAGIC_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NEOMAGIC_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEOMAGIC_LICENSE = MIT
-- 
2.20.1
