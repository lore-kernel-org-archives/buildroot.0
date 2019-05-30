From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 00:43:11 +0200
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 19.0.5
Message-ID: <20190530224415.2FEC98E55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4554610bde56b0b7f140f6833fc44ebfb7cd7310
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk |  2 +-
 package/mesa3d/mesa3d.hash               | 10 +++++-----
 package/mesa3d/mesa3d.mk                 |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 22e3e1d28e..5cb34d36bc 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.0.3
+MESA3D_HEADERS_VERSION = 19.0.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index d4d20c64bf..5a3eb1fa0f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-April/000510.html
-md5 d03bf14e42c0e54ebae5730712ccc408 mesa-19.0.3.tar.xz
-sha1 e028365fb8c7ae73bb0f01807c9137ec856c8e52 mesa-19.0.3.tar.xz
-sha256 f027244e38dc309a4c12db45ef79be81ab62c797a50a88d566e4edb6159fc4d5 mesa-19.0.3.tar.xz
-sha512 aa170577252aa4157e4bd49076bbf6207e4aada9fc9f23b255de332e816f9c63e5661f752f2f276dd43e232a8926866004e2a2ff9ad4b411330969c2a9a7ffa0 mesa-19.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-May/000515.html
+md5 1509a3251d459fd8b6fadf9329669dc1  mesa-19.0.5.tar.xz
+sha1 647352d5989d3ca9b5c83fe06ed1d84f341f6ad5  mesa-19.0.5.tar.xz
+sha256 6aecb7f67c136768692fb3c33a54196186c6c4fcafab7973516a355e1a54f831  mesa-19.0.5.tar.xz
+sha512 aecd5ee54ac0316d5e318dbea0abdc06f23e67d75d36eb82d6cf6a396c9e850e1ccf4fa8815f8c4097b6039ebb1524673189350cbfd4b766ce75ce17c26d9d8d  mesa-19.0.5.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 576e8f0a2d..630f181ddb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.0.3
+MESA3D_VERSION = 19.0.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
