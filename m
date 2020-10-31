From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 16:08:28 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: bump
 version to 1.18.1
Message-ID: <20201031145618.23539840DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95b4163a3e851debbeb6aad4d287c311b61e735b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license info:

- GPL-2.0+ text in COPYING was replaces with LGPL-2.0+ with
  commit [1]
- COPYING.LIB was removed and LGPL-2.0 replaced with LGPL-2.1+
  with commit [2]
- keep the license info to LGPL-2.0+ (as the source files state
  ('version 2 of the License, or (at your option) any later version')

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=daf8f65be1cccbe0b22c0734732816af4911dcb5
[2] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/?id=142c1e7a06301a92688830dcf04c04d21285a7e7

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash | 7 +++----
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
index 23cf43f543..573178dc2d 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.hash
@@ -1,4 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.0.tar.xz.sha256sum
-sha256  f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f  gst-plugins-bad-1.18.0.tar.xz
-sha256  0b12e4d1cd5db5f8a0c04fc98a1d8c3acc533097b6198d6644420da78d460223  COPYING
-sha256  cf9b86bcf2d298e8cf5b9d8982f9dab296465b002fdfa0347357a0732f961e03  COPYING.LIB
+# From https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-1.18.1.tar.xz.sha256sum
+sha256  c195978c85d97406c05eb9d43ac54b9ab35eda6ffdae32b3ed597b8f1743c1b2  gst-plugins-bad-1.18.1.tar.xz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ec5097fc69..78a3785449 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.18.0
+GST1_PLUGINS_BAD_VERSION = 1.18.1
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 # Additional plugin licenses will be appended to GST1_PLUGINS_BAD_LICENSE and
 # GST1_PLUGINS_BAD_LICENSE_FILES if enabled.
-GST1_PLUGINS_BAD_LICENSE_FILES = COPYING.LIB
-GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+, LGPL-2.1+
+GST1_PLUGINS_BAD_LICENSE_FILES = COPYING
+GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+
 
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
