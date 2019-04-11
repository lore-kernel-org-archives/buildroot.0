From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 11 Apr 2019 08:36:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.0.2
Message-ID: <20190411063650.21117-1-bernd.kuhls@t-online.de>
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
index e40a8556e4..7696b3a861 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.1
+MESA3D_HEADERS_VERSION = 19.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 6495191b0f..8971e28a3b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-March/000505.html
-md5 19636bb3da35c21f43040d31e575d5ce  mesa-19.0.1.tar.xz
-sha1 41e825653b29c847912d51a37ff4cff4bab3d878  mesa-19.0.1.tar.xz
-sha256 6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4  mesa-19.0.1.tar.xz
-sha512 13afade840dfc44198b08298c9ebeb24c626c98bfff3ec6d08daaaea690ea9d47af466c877146f9afa3b45035e02c1e21fdc4b53a79c99e38dfc6126efe8ece5  mesa-19.0.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-April/000508.html
+md5 7f84af1c3fe2078c35a7a991d1469921  mesa-19.0.2.tar.xz
+sha1 554dad1da57f9de09ac5732ba9a27ef26f9c3005  mesa-19.0.2.tar.xz
+sha256 1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802  mesa-19.0.2.tar.xz
+sha512 6b317205efa7d62150fae23489fbad5f062ecde99fb5b210fa7ccbed2e0ef60aee1f1e66e2c606ea5d59193c3218f732556706ab3b645b175044342d88984d51  mesa-19.0.2.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7e7f913180..bc327d5b3b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.1
+MESA3D_VERSION = 19.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
