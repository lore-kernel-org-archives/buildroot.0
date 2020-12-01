From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 21:45:01 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.2.3
Message-ID: <20201203092228.029608012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e66d996100bc8bff94cbe6651b74a04083b8b35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2020-November/000607.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 12020e6551..8e8170a7a5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.2.2
+MESA3D_HEADERS_VERSION = 20.2.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 7d3a928822..b59d1f866e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-November/000604.html
-sha256  1f93eb1090cf71490cd0e204e04f8427a82b6ed534b7f49ca50cea7dcc89b861  mesa-20.2.2.tar.xz
-sha512  36673a44fad8c6db3516b23b75825a52df520b9fe1387160301dd5051f420ebf0d1c7b4f8ff96a5547b79c2ba42fd782305ae23ac956f688b695c07b8fe73192  mesa-20.2.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-November/000607.html
+sha256  ae1b240e11531df528d14dc214d2dc4d2b4f2e835c6230ba0b492b171eceb82b  mesa-20.2.3.tar.xz
+sha512  e55b57523f6fdb1199586538c119c3e7c81d1a7af86be14c90d140c514f65e54ac0c56bd341686d04b770b80d3ddd92188ee17b3bc23f243aed10c25de7e19a6  mesa-20.2.3.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a44d599b03..5af3cbb3f4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.2.2
+MESA3D_VERSION = 20.2.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
