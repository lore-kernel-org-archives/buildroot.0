From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sat, 30 May 2020 09:53:24 +0200
Subject: [Buildroot] [PATCH/next] package/libqmi: bump to version 1.24.14
Message-ID: <20200530075324.123263-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://lists.freedesktop.org/archives/libqmi-devel/2020-May/003321.html

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
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
--
2.26.2
