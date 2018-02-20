From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 20 Feb 2018 22:39:25 +0100
Subject: [Buildroot] [PATCH for-master] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.5
Message-ID: <20180220213925.23672-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a emergency release fixing major a issue in the RADV driver [1].

[1] https://lists.freedesktop.org/archives/mesa-announce/2018-February/000401.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index cd8911d5d4..4c1353ac7a 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.4
+MESA3D_HEADERS_VERSION = 17.3.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 2caf7d5173..cb4041172a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-February/000400.html
-md5 f08eccad27f34366db1bb3997d288c2f  mesa-17.3.4.tar.xz
-sha1 bb9be653a26d89f3b6c4c00c64f4a5896d9d7f38  mesa-17.3.4.tar.xz
-sha256 71f995e233bc5df1a0dd46c980d1720106e7f82f02d61c1ca50854b5e02590d0  mesa-17.3.4.tar.xz
-sha512 8a077aa89b9d314188e62a215abe8e0db890afbbdd9c1ba9d214735d5304956b55723132f19e8a4ac3e3f404eca1dd9b5fbc936de9ac63d91562c0bc62708fe3  mesa-17.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-February/000401.html
+md5 bf73288c33cf12abe62045c25e2196b4  mesa-17.3.5.tar.xz
+sha1 5168471ad19945a2f76a14c842b8273e4c29aba4  mesa-17.3.5.tar.xz
+sha256 eb9228fc8aaa71e0205c1481c5b157752ebaec9b646b030d27478e25a6d7936a  mesa-17.3.5.tar.xz
+sha512 39ada2480aa12c42bbff6a1b5c957f99934193d19eb5f44e102ef8302d26f777cee63af1140aa8623bbc1ebd6d69e172cecca798780b8eb594f2ebbb217afd29  mesa-17.3.5.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c275579fb8..7e46681ab7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.4
+MESA3D_VERSION = 17.3.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.14.3
