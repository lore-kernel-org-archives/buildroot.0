From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:55:32 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.5
Message-ID: <20180727215009.86F018A512@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57d4a27eaf1a9e59d767c321e7b7500c5060a2ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8c317916e5..de8a9dc7cf 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.1.4
+MESA3D_HEADERS_VERSION = 18.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 7279e8d9f3..ff336f7d41 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-July/000442.html
-md5 7abc628e2e34b2f478d906b6d233ade3  mesa-18.1.4.tar.xz
-sha1 b5af29aff8b7abe070103ea2cc625d38b4eb1611  mesa-18.1.4.tar.xz
-sha256 3061488b5d85504092cf4343816cfb2d96f2ad9bc2edec31fc96933d184cf58b  mesa-18.1.4.tar.xz
-sha512 04b8e5bbfa640f2303c388ab701fc2aca7f6d5d127ca5a9f9409975556813ba8e94305d27c9cea236a0e6d44a38b97e2877509268a96d9ed2a6762ab385aa3dc  mesa-18.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-July/000445.html
+md5 622bd23ca8daa83a62938bd33600a580  mesa-18.1.5.tar.xz
+sha1 1ca7d5f5d12c95f8da137be34223229b9f0594fe  mesa-18.1.5.tar.xz
+sha256 69dbe6f1a6660386f5beb85d4fcf003ee23023ed7b9a603de84e9a37e8d98dea  mesa-18.1.5.tar.xz
+sha512 f0bcb903bbf2ff7fc0b4a8fe100ea26ee91c0029b64adaf5fc4877ed7681f325c54b1be8eb0b140bff620da79f30a96375c2e1085e504ebfaf50e57f6da93013  mesa-18.1.5.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 3a0cf6c7835f98f86d5579b2cc517f84254da7411f764fb0095a383fb0759771  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 324e0a1e7b..21891864b3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.1.4
+MESA3D_VERSION = 18.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
