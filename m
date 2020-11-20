From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 20 Nov 2020 21:29:06 +0100
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to 1.0.2
Message-ID: <20201120202906.25604-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-November/041659.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index c643f1c4ac..1725eaecfb 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-September/041609.html
-sha256  ab68b25341c99f2218d7cf3dad459c1827f411219901ade05bbccbdb856b6c8d  libxkbcommon-1.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-November/041659.html
+sha256  0ea2f88f4472bbf8170c5a7112f5af8848a908ca15df9e9086c3de0189612b2b  libxkbcommon-1.0.2.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index bf1bd058cb..cce5c02735 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.0.1
+LIBXKBCOMMON_VERSION = 1.0.2
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-- 
2.29.2
