From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Oct 2019 22:00:47 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 19.2.1
Message-ID: <20191013195621.BC8AF81078@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a75aab5a4cf4437706542eb2cbae293bf8cad220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a34df2e93f..8670184742 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 19.2.0
+MESA3D_HEADERS_VERSION = 19.2.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 36b5307972..6dabb6fda4 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2019-September/000547.html
-sha256 b060caa2a00f856431160ff7377d0e8f58f2aa48c16ee5a9e265ebdccb10852a  mesa-19.2.0.tar.xz
-sha512 7278bbfba9c29fe91d1959ff1a48422e917db85287460523d12ae8c6d7f49f76e9636bf4c0d8d7d89e5569b3c67135f1b23b8f6c9d52d39413d8ec22e3bb40f0  mesa-19.2.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-October/000548.html
+sha256 4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9  mesa-19.2.1.tar.xz
+sha512 decd74976fe866bf67fac4ae55a62d8e33ad24278dd58effe533e7d258b249f0ead848360e7e71444265184c6d9d9b04361caf0c6df99504e33599e7a0cd6c5d  mesa-19.2.1.tar.xz
 
 # License
 sha256 d8d662974fc86e2e640362015e42de3fcc161d435a9f2111ecd8561412feca73  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 03a9c49a69..b1238ec519 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 19.2.0
+MESA3D_VERSION = 19.2.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
