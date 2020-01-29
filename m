From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 29 Jan 2020 19:40:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 19.3.3
Message-ID: <20200129184047.414824-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ccd008cedf..3d9ee365ed 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.3.2
+MESA3D_HEADERS_VERSION = 19.3.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 45b38abf2b..e14b890e73 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-January/000566.html
-sha256 4e3aee324616352bbc7f58d47ab573e10f68cc7719fd045bd6d3abcdd97ee1c1  mesa-19.3.2.tar.xz
-sha512 fb69999fa7a15cd6f2c254fb6e8fe635e56dc49a5c2c762a96c77815cbad77060b8f81a02e67ac9ec58092ab866e080fb928086a5ac1e61c3efe882e5825cd28  mesa-19.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-January/000567.html
+sha256 81ce4810bb25d61300f8104856461f4d49cf7cb794aa70cb572312e370c39f09  mesa-19.3.3.tar.xz
+sha512 1f792fbde71132afd4a43d6abe6a3d640f375e83641c6144c82312774434c9588ffba65a3ba38394947bd753656aa85213b6cd9f745cec0040c0559eb41f0dc9  mesa-19.3.3.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f6f276c92d..50a29aa7db 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.3.2
+MESA3D_VERSION = 19.3.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.20.1
