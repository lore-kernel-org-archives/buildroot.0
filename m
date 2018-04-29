From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Apr 2018 09:10:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.0.2
Message-ID: <20180429071038.32749-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 242cd4f85b..3a1e62fe66 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.0.1
+MESA3D_HEADERS_VERSION = 18.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b6809fdf0d..734df00306 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-April/000419.html
-md5 a240b17769ad5ff918507848590f9397  mesa-18.0.1.tar.xz
-sha1 90ce55e5d7b522d8bdc401e9864416cc54d02ccd  mesa-18.0.1.tar.xz
-sha256 b2d2f5b5dbaab13e15cb0dcb5ec81887467f55ebc9625945b303a3647cd87954  mesa-18.0.1.tar.xz
-sha512 b0d610904b6f179a27b42aee5f479339e341926915cdc6adb08ac999a4a12539abc3776577e86af83e10381d9703ef1bca70bab81b43daf2c000622c9c3612d2  mesa-18.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-April/000423.html
+md5 3c303da98ec2ce37c795baeba5aee31e  mesa-18.0.2.tar.xz
+sha1 2c8a500c48fdf68949328506916405936d99ee97  mesa-18.0.2.tar.xz
+sha256 98fa159768482dc568b9f8bf0f36c7acb823fa47428ffd650b40784f16b9e7b3  mesa-18.0.2.tar.xz
+sha512 77d24d01c4c22596d28421aeb74932ff232730a4f556ae1a2e8777ece2876e4e352679575385c065505df4a2a83d2c1cf30db92dcf88038417e36a2768332d7e  mesa-18.0.2.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 9857b597cf..cabffb11fb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.0.1
+MESA3D_VERSION = 18.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.14.2
