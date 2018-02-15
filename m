From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 22:13:24 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.4
Message-ID: <20180215211504.3D61180FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbd12ed37ea2d84a21cef8a9ec55889b287ceab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b543fc097a..cd8911d5d4 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.3
+MESA3D_HEADERS_VERSION = 17.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f7a77b56b0..2caf7d5173 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-January/000393.html
-md5 139b5f608b371c0d4395596162f88791  mesa-17.3.3.tar.xz
-sha1 346f7813f493b1daf9d9079826a13dbd722b86ab  mesa-17.3.3.tar.xz
-sha256 41bac5de0ef6adc1f41a1ec0f80c19e361298ce02fa81b5f9ba4fdca33a9379b  mesa-17.3.3.tar.xz
-sha512 7ac8ecdcf3b2b43239835bc2c5da7f2730f80a2db945fe00df03d1548920fbc074dd4806ddd345a1ce682fd29d75b2209ef81b6b06e657f9c8ae8622a34a03c1  mesa-17.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-February/000400.html
+md5 f08eccad27f34366db1bb3997d288c2f  mesa-17.3.4.tar.xz
+sha1 bb9be653a26d89f3b6c4c00c64f4a5896d9d7f38  mesa-17.3.4.tar.xz
+sha256 71f995e233bc5df1a0dd46c980d1720106e7f82f02d61c1ca50854b5e02590d0  mesa-17.3.4.tar.xz
+sha512 8a077aa89b9d314188e62a215abe8e0db890afbbdd9c1ba9d214735d5304956b55723132f19e8a4ac3e3f404eca1dd9b5fbc936de9ac63d91562c0bc62708fe3  mesa-17.3.4.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3f907c9463..c275579fb8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.3
+MESA3D_VERSION = 17.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
