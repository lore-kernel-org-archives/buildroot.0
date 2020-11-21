From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 12:21:30 +0100
Subject: [Buildroot] [PATCH/next 5/6] package/x11r7/xdriver_xf86-video-vesa:
 bump version to 2.5.0
In-Reply-To: <20201121112131.756930-1-bernd.kuhls@t-online.de>
References: <20201121112131.756930-1-bernd.kuhls@t-online.de>
Message-ID: <20201121112131.756930-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-vesa.hash                       | 10 ++++------
 .../xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
index ee27690093..d179228a74 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-February/002837.html
-md5 8134201beaf6f77150c7809c3cc802e6  xf86-video-vesa-2.4.0.tar.bz2
-sha1 99b69044c34292ba062e365c07dcd024462e794b  xf86-video-vesa-2.4.0.tar.bz2
-sha256 bf443c94d7bf6cd4e248f8a3147f4647be04dc4c80250d9405006263bbdee38c  xf86-video-vesa-2.4.0.tar.bz2
-sha512 4af5c0a7fd64eba503980198cf510688dff2f33482ceac446455d97255dcc828613387ac57828eb6dce080cb15a8644a2b2e278bf356705fdeaea873ab07c2de  xf86-video-vesa-2.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-September/003060.html
+sha256  1f1624f3c73906801ad1bc98335a2cb5676a7a4d18e5374d9a1d18464e54c659  xf86-video-vesa-2.5.0.tar.bz2
+sha512  36fd921f54f33eb25966b5f9ea1e1b3e9009965c012c8b9c676686b472111719921b80cf62dafc746058878253e21f0ef341a2ff2d650df22ca1e35e81716a8b  xf86-video-vesa-2.5.0.tar.bz2
 # Locally computed
-sha256 bda49ba1e860501c20fd444423bc790f6da4f769561b69acc0cbe5abff9409b6  COPYING
+sha256  bda49ba1e860501c20fd444423bc790f6da4f769561b69acc0cbe5abff9409b6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 425280a119..b08bab4ec8 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VESA_VERSION = 2.4.0
+XDRIVER_XF86_VIDEO_VESA_VERSION = 2.5.0
 XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_VESA_LICENSE = MIT
-- 
2.27.0
