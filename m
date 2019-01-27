From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:45:13 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mga: bump
 version to 2.0.0
Message-ID: <20190127095108.8012283BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37edd8a62a17fb4c693bfdb7bf310a7a943f3ffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash | 9 +++++++--
 package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
index 0187e6fbb5..218e52e19c 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002765.html
-sha256 b663cd8e6364f7c4e2637b9fcab9861d0e3971518c73b00d213f6545a1289422  xf86-video-mga-1.6.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-December/002933.html
+md5 b8fc99b4adea8bfe80156b13df4b6c9c  xf86-video-mga-2.0.0.tar.bz2
+sha1 833f2710a1fd7b3f2db3700b2ad055527da5033b  xf86-video-mga-2.0.0.tar.bz2
+sha256 268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79  xf86-video-mga-2.0.0.tar.bz2
+sha512 b92006486aef815ff4399f291d610c65d88c0b32a9dae97658c644715ff62b221b01495b5c7a2311745e26f699c1c1f753b81c7bf54cf75567af9f78ac015540  xf86-video-mga-2.0.0.tar.bz2
+# Locally computed
+sha256 6c567575e381478c7616eedff3ea2ae5228a5b54fbdd22d4070ebae312fa085c  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
index bdc9f35884..2720848a17 100644
--- a/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
+++ b/package/x11r7/xdriver_xf86-video-mga/xdriver_xf86-video-mga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_MGA_VERSION = 1.6.5
+XDRIVER_XF86_VIDEO_MGA_VERSION = 2.0.0
 XDRIVER_XF86_VIDEO_MGA_SOURCE = xf86-video-mga-$(XDRIVER_XF86_VIDEO_MGA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_MGA_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_MGA_LICENSE = MIT
