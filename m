From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 May 2017 20:31:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xdriver_xf86-input-libinput:
	bump version to 0.25.1
In-Reply-To: <20170507183121.17599-1-bernd.kuhls@t-online.de>
References: <20170507183121.17599-1-bernd.kuhls@t-online.de>
Message-ID: <20170507183121.17599-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash | 9 +++++----
 .../xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 36d16c21d..48283082d 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-March/002782.html
-md5 bd64be831914eda924f7166243c34968  xf86-input-libinput-0.25.0.tar.bz2
-sha1 e43fd18bc32b892fb203f842186ad0d6c675b696  xf86-input-libinput-0.25.0.tar.bz2
-sha256 bb7fd1658fa7e6c757fd55480aa8a07f8ccfb0a80ae42c29dbc67d57958c556f  xf86-input-libinput-0.25.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2017-May/002798.html
+md5 14003139614b25cc76c9a4cad059df89  xf86-input-libinput-0.25.1.tar.bz2
+sha1 00494b7566c0c5cbcb8d81655b967f42f7a40ef0  xf86-input-libinput-0.25.1.tar.bz2
+sha256 489f7d591c9ef08463d4966e61f7c6ea433f5fcbb9f5370fb621da639a84c7e0  xf86-input-libinput-0.25.1.tar.bz2
+sha512 9a8d16bdffb73a5318d22e352826c410ccb6f8c7ade31c23823bd6c17202bb67e917dfe8d4cab6e54fdf15f201d14d80b6306cedc5f93f66989edfcab5082ece  xf86-input-libinput-0.25.1.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index 16ab7ce17..4e3976135 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.25.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.25.1
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
-- 
2.11.0
