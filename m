From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 18 Sep 2017 20:24:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.26.0
Message-ID: <20170918182459.12094-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput.hash                           | 10 +++++-----
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 48283082d3..43b8f78f96 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-May/002798.html
-md5 14003139614b25cc76c9a4cad059df89  xf86-input-libinput-0.25.1.tar.bz2
-sha1 00494b7566c0c5cbcb8d81655b967f42f7a40ef0  xf86-input-libinput-0.25.1.tar.bz2
-sha256 489f7d591c9ef08463d4966e61f7c6ea433f5fcbb9f5370fb621da639a84c7e0  xf86-input-libinput-0.25.1.tar.bz2
-sha512 9a8d16bdffb73a5318d22e352826c410ccb6f8c7ade31c23823bd6c17202bb67e917dfe8d4cab6e54fdf15f201d14d80b6306cedc5f93f66989edfcab5082ece  xf86-input-libinput-0.25.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-September/002807.html
+md5 da47ef62eab1d0e922a8fa929ff81758  xf86-input-libinput-0.26.0.tar.bz2
+sha1 3f55b8a5d4ff51d4f0cfe3fe9ace66227193abd4  xf86-input-libinput-0.26.0.tar.bz2
+sha256 abca558fc2226f295691f1cf3412d4c0edeaa439f677ca25b5c9fab310d2387b  xf86-input-libinput-0.26.0.tar.bz2
+sha512 b52a27e916f7e86576500ef2bc3ce640676f5a710543755865a723628c0e01a575989460853bac184ed696961e3f8fca72ecba8ad4625be8cd9e31f9a55f5e97  xf86-input-libinput-0.26.0.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 4e3976135d..dab24b1235 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.25.1
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.26.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.11.0
