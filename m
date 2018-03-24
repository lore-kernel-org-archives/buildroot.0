From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 21:38:06 +0100
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-libinput:
 bump version to 0.27.0
Message-ID: <20180324204059.8C75982DCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff5aab9dfe3b057607269904164ee842d69fd4e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../xdriver_xf86-input-libinput.hash                         | 12 +++++++-----
 .../xdriver_xf86-input-libinput.mk                           |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
index 43b8f78f96..0c24f82880 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.hash
@@ -1,5 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-September/002807.html
-md5 da47ef62eab1d0e922a8fa929ff81758  xf86-input-libinput-0.26.0.tar.bz2
-sha1 3f55b8a5d4ff51d4f0cfe3fe9ace66227193abd4  xf86-input-libinput-0.26.0.tar.bz2
-sha256 abca558fc2226f295691f1cf3412d4c0edeaa439f677ca25b5c9fab310d2387b  xf86-input-libinput-0.26.0.tar.bz2
-sha512 b52a27e916f7e86576500ef2bc3ce640676f5a710543755865a723628c0e01a575989460853bac184ed696961e3f8fca72ecba8ad4625be8cd9e31f9a55f5e97  xf86-input-libinput-0.26.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002885.html
+md5 efc5ea72070411ef077a9dd096cfd41b  xf86-input-libinput-0.27.0.tar.bz2
+sha1 127dba35576296d1800b7a29344c13da90141d4c  xf86-input-libinput-0.27.0.tar.bz2
+sha256 77b0516cb0bff616f491faed7f7794fef9dc496edc2dc7d6197324727cc668a3  xf86-input-libinput-0.27.0.tar.bz2
+sha512 716a9b43438acd6b7c6a834a08ecec244fecdc31e77241998414bf1748781026cd6c6e85947155c44400e0192769a714dfbfa0ed42ba3677347cd89ac1081743  xf86-input-libinput-0.27.0.tar.bz2
+# Locally computed
+sha256 b808a8a077995380c6064bec41616f98546b0b2e79bb7f3d0247d290e275b396  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
index dab24b1235..cf195ffa10 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
+++ b/package/x11r7/xdriver_xf86-input-libinput/xdriver_xf86-input-libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.26.0
+XDRIVER_XF86_INPUT_LIBINPUT_VERSION = 0.27.0
 XDRIVER_XF86_INPUT_LIBINPUT_SOURCE = xf86-input-libinput-$(XDRIVER_XF86_INPUT_LIBINPUT_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_LIBINPUT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_LIBINPUT_LICENSE = MIT
