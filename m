From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:50 +0100
Subject: [Buildroot] [PATCH 24/31] package/x11r7/xdriver_xf86-video-tdfx:
 bump version to 1.5.0
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-24-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash | 9 +++++++--
 .../xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
index 84885596f6..5e9a88fbde 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.hash
@@ -1,2 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002755.html
-sha256 4cf48ee14ead52b23493c3dce5032496fd68bf1d000170bb138730497e212a42  xf86-video-tdfx-1.4.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002944.html
+md5 4697f0cc69ff1ff90bc770863c158d29  xf86-video-tdfx-1.5.0.tar.bz2
+sha1 8042dd0c2bc5a396b2cfeb5418b03059a089be25  xf86-video-tdfx-1.5.0.tar.bz2
+sha256 2f4580e1f66901dd578d6e1f73df8150fd4b8480eb0c9653d4c5d8e0f8e78561  xf86-video-tdfx-1.5.0.tar.bz2
+sha512 eca3359c7db56183a1cfcce7295e41ccc349005ee1cbcf75209f1e4e8e04e887ba511712ef35efc11c940713c8327b0b8ab8b6c86facf02062b3e84c0b1af5ff  xf86-video-tdfx-1.5.0.tar.bz2
+# Locally computed
+sha256 5bb3d3baff0b7bbef885215ca9c12a5be1a42c848c96601b699637557fbb41ec  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 6511eec7ad..8975334f90 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.7
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.5.0
 XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TDFX_LICENSE = MIT
-- 
2.20.1
