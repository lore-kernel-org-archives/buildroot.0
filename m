From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:06:49 +0100
Subject: [Buildroot] [git commit] package/libxkbcommon: bump version to 1.1.0
Message-ID: <20210316194402.7AFC187764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b554a4c6f36d7275efba8223653967e5020c91e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-March/041747.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxkbcommon/libxkbcommon.hash | 4 ++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index 77bb20c3ef..40cad4d0b7 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-November/041660.html
-sha256  a2202f851e072b84e64a395212cbd976ee18a8ee602008b0bad02a13247dbc52  libxkbcommon-1.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-March/041747.html
+sha256  412cfcca596f92914ea1a66ad244804d73a5ff20b6d86459951e7ad20576c246  libxkbcommon-1.1.0.tar.xz
 
 # License file:
 sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index b592cd99df..8780706c7e 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 1.0.3
+LIBXKBCOMMON_VERSION = 1.1.0
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
