From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 11 Feb 2019 21:53:17 +0100
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to 0.8.3
Message-ID: <20190211205317.15440-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1]:
- Fix build of static libraries with meson.
- New API: XKB_KEY_XF86MonBrightnessCycle/XKB_KEY_XF86RotationLockToggle

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-February/039970.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note: The autotools build will be removed in libxkbcommon 0.9.0.
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 67ae4b5921..e4a56873ea 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039243.html
-sha256 7ab8c4b3403d89d01898066b72cb6069bddeb5af94905a65368f671a026ed58c libxkbcommon-0.8.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-February/039970.html
+sha256 b855c629849a97ab9835a4ad99d6b749a636f70d38a03f070c6ef72024825540 libxkbcommon-0.8.3.tar.xz
 
 # License file:
 sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 2045d96380..801782b38c 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.8.2
+LIBXKBCOMMON_VERSION = 0.8.3
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-- 
2.20.1
