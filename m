From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 29 Mar 2019 20:00:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.0.1
Message-ID: <20190329190029.28053-1-bernd.kuhls@t-online.de>
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
index 63bcd8686f..e40a8556e4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.0
+MESA3D_HEADERS_VERSION = 19.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 42dde03c27..6495191b0f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-March/000501.html
-md5 d0d76cd8b00bc1308e37985d4a45d3c5  mesa-19.0.0.tar.xz
-sha1 d6353eab5e8949d14f15138fb726f5e298c70485  mesa-19.0.0.tar.xz
-sha256 5a549dfb40ec31e5c36c47aadac04554cb2e2a8d144a046a378fc16da57e38f8  mesa-19.0.0.tar.xz
-sha512 5759b85275bcd145513cf14a9ef7505595766fb33b82c53738f74ede462e5850580d48ab4af326b41209e7f4b05aab75539f2bfebf67c3098a4680ea95c37591  mesa-19.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-March/000505.html
+md5 19636bb3da35c21f43040d31e575d5ce  mesa-19.0.1.tar.xz
+sha1 41e825653b29c847912d51a37ff4cff4bab3d878  mesa-19.0.1.tar.xz
+sha256 6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4  mesa-19.0.1.tar.xz
+sha512 13afade840dfc44198b08298c9ebeb24c626c98bfff3ec6d08daaaea690ea9d47af466c877146f9afa3b45035e02c1e21fdc4b53a79c99e38dfc6126efe8ece5  mesa-19.0.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f6c45d2525..928e9eb1b9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.0
+MESA3D_VERSION = 19.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
