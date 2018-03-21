From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 21 Mar 2018 19:09:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.7
Message-ID: <20180321180914.4578-1-bernd.kuhls@t-online.de>
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
index 4eb57b3ad4..50dcb67278 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.6
+MESA3D_HEADERS_VERSION = 17.3.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index a61fe02b6d..4bc4e820b8 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-February/000403.html
-md5 ba66ae0f09b9b84482268608557cd175  mesa-17.3.6.tar.xz
-sha1 eff29cb8c284a813977d4201dd646d949b1d8fc4  mesa-17.3.6.tar.xz
-sha256 e5915680d44ac9d05defdec529db7459ac9edd441c9845266eff2e2d3e57fbf8  mesa-17.3.6.tar.xz
-sha512 5164ed5a1d3d25031b712a9f443f0e467a29b2bca0a1aa11324ed5c10279411979c9c7482825053926a813e76c58b78a3439c7c81fcd51a7808f53977080828f  mesa-17.3.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-March/000410.html
+md5 769137f2538562c300c4b76bcb097377  mesa-17.3.7.tar.xz
+sha1 c66108a562cc94a9559357ca2b424f99c7f995e8  mesa-17.3.7.tar.xz
+sha256 0595904a8fba65a8fe853a84ad3c940205503b94af41e8ceed245fada777ac1e  mesa-17.3.7.tar.xz
+sha512 ec48565556aa4281056cee5dbef140553651fdfbb76ce32397de048db1cf65f5e18787c72b998de7da2de795d27e7040bde84651ade4726fc3a69a23b166ba4e  mesa-17.3.7.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5f4832c0f0..8e4aa7d5ac 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.6
+MESA3D_VERSION = 17.3.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.11.0
