From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 18 Aug 2018 10:31:37 +0200
Subject: [Buildroot] [PATCH v1] libxkbcommon: bump version to 0.8.2
Message-ID: <20180818083137.2557-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 0.8.2 and add hash for the license file.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libxkbcommon/libxkbcommon.hash | 7 +++++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 525f9ffd20..67ae4b5921 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,2 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2017-January/032725.html
-sha256	ba59305d2e19e47c27ea065c2e0df96ebac6a3c6e97e28ae5620073b6084e68b	libxkbcommon-0.7.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039243.html
+sha256 7ab8c4b3403d89d01898066b72cb6069bddeb5af94905a65368f671a026ed58c libxkbcommon-0.8.2.tar.xz
+
+# License file:
+sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 601181446d..2045d96380 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.7.1
+LIBXKBCOMMON_VERSION = 0.8.2
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
-- 
2.18.0
