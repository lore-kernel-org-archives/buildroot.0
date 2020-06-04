From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:24:46 +0200
Subject: [Buildroot] [git commit] package/libqmi: bump to 1.24.14
Message-ID: <20200604212411.F3D4683AF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=557fb0c89255ea243aad4999358c3330b22285e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* libqmi-glib:
   ** Fix build with GLib < 2.44.
   ** Fix UTF-8 string validation when the string contains a trailing NUL byte
      (e.g. the Sierra specific "DMS Swi Get Current Firmware" command).

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 6341bce8ea..e166b66b22 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  2d3b91a2b8a882b17b16403c9ef7bdce522db4f0ceaa3e4dff76033885428b69  libqmi-1.24.12.tar.xz
+sha256  208fe3e94dabe1d8117d1023d841737b6fe92aaff21ef8f35bbed15417ee507f  libqmi-1.24.14.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 260dcd1f66..0398100be7 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.24.12
+LIBQMI_VERSION = 1.24.14
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
