From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:49:18 +0200
Subject: [Buildroot] [git commit] package/libxkbcommon: bump version to 0.8.4
Message-ID: <20191007204421.0AD448A545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea236226e3d663d0330f71c234d28fcc09385782
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libxkbcommon/libxkbcommon.hash | 6 ++++--
 package/libxkbcommon/libxkbcommon.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
index e4a56873ea..c734f3ad9f 100644
--- a/package/libxkbcommon/libxkbcommon.hash
+++ b/package/libxkbcommon/libxkbcommon.hash
@@ -1,5 +1,7 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-February/039970.html
-sha256 b855c629849a97ab9835a4ad99d6b749a636f70d38a03f070c6ef72024825540 libxkbcommon-0.8.3.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-February/040102.html
+md5 3c4409058dfd203f641a563358e0187d  libxkbcommon-0.8.4.tar.xz
+sha1 0ce9df42239d451f61b2112c6ba8d0a1a0879009  libxkbcommon-0.8.4.tar.xz
+sha256 60ddcff932b7fd352752d51a5c4f04f3d0403230a584df9a2e0d5ed87c486c8b  libxkbcommon-0.8.4.tar.xz
 
 # License file:
 sha256 086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb LICENSE
diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 801782b38c..1f54de4267 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.8.3
+LIBXKBCOMMON_VERSION = 0.8.4
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
