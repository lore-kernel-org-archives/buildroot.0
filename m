From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 10 Jul 2018 23:56:02 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mach64:
 bump version to 6.9.6
Message-ID: <20180710215810.8C7A288315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4bf4fbebe7725669e86db604945322a8f2a94b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash and all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash     | 9 +++++++--
 .../x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
index 43a7fa707e..55acd74652 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-May/002599.html
-sha256	3e98985b6e044189efd42342862208f472881c25debf22230a1d54a96d71b41f	xf86-video-mach64-6.9.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-May/002896.html
+md5 0e12f9a3b5659e1e27e03adc42b04d99  xf86-video-mach64-6.9.6.tar.bz2
+sha1 1fdf0c3488ab88cb46b563efee166a5d54a01932  xf86-video-mach64-6.9.6.tar.bz2
+sha256 7a0707c71bb522430f83bb5e9d9ee697e661e35534a3a2d10834f86b327a3c9c  xf86-video-mach64-6.9.6.tar.bz2
+sha512 687f6ac60491b704d5c4788463763d2f4bf725611e10bd2163156963fe0a8fdbffe0a1b7c737eff131f01759e43b5ec3544a7dabe66a67e85b286dcb969da2f1  xf86-video-mach64-6.9.6.tar.bz2
+# Locally computed
+sha256 a7d68021893bced0d709338a59a137c74b11e624880e110e4a2f14ccef475120  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 599036033d..ca24d39e43 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.5
+XDRIVER_XF86_VIDEO_MACH64_VERSION = 6.9.6
 XDRIVER_XF86_VIDEO_MACH64_SOURCE = xf86-video-mach64-$(XDRIVER_XF86_VIDEO_MACH64_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MACH64_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_MACH64_LICENSE = MIT
