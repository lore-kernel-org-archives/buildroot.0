From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 18:47:57 +0200
Subject: [Buildroot] [git commit branch/next] package/wpebackend-fdo: bump
 to version 1.9.92
Message-ID: <20210518162117.4F0DA86EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=994633108c62a11409c724b3c2b3f84f979fa9da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to version 1.9.92 which, while even being a release candidate,
is more stable than the 1.8.1 present in Buildroot.

Release notes:

  https://wpewebkit.org/release/wpebackend-fdo-1.9.90.html
  https://wpewebkit.org/release/wpebackend-fdo-1.9.91.html
  https://wpewebkit.org/release/wpebackend-fdo-1.9.92.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
 package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wpebackend-fdo/wpebackend-fdo.hash b/package/wpebackend-fdo/wpebackend-fdo.hash
index 27e827ae2e..28d6c36938 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.hash
+++ b/package/wpebackend-fdo/wpebackend-fdo.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpebackend-fdo-1.8.3.tar.xz.sums
-md5  980cbda207bf8f6263799c5062425737  wpebackend-fdo-1.8.3.tar.xz
-sha1  c849043039d805448715be90cb5b3491f0a90c5f  wpebackend-fdo-1.8.3.tar.xz
-sha256  3d0b4282a1bd9e0664d7a20abe14e982f3285296ac62de56cae2a404b9d28b9e  wpebackend-fdo-1.8.3.tar.xz
+# From https://wpewebkit.org/releases/wpebackend-fdo-1.9.92.tar.xz.sums
+md5  5c2f7fab6623e0964bc0d1b4a01719f0  wpebackend-fdo-1.9.92.tar.xz
+sha1  d07fdfec0df53c57e3ed36a1efffecf30d1b418c  wpebackend-fdo-1.9.92.tar.xz
+sha256  fc5b388a91d6f2c22803e1a21a6759a314b4539e5169c6e272bfc953a05fbb85  wpebackend-fdo-1.9.92.tar.xz
 
 # Hashes for license files:
 sha256  c9f6803371047fad3e72200ec6cd226329a5ee08ac61104c8211c2761fb46825  COPYING
diff --git a/package/wpebackend-fdo/wpebackend-fdo.mk b/package/wpebackend-fdo/wpebackend-fdo.mk
index 5f7e7acf30..4979dad8f9 100644
--- a/package/wpebackend-fdo/wpebackend-fdo.mk
+++ b/package/wpebackend-fdo/wpebackend-fdo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEBACKEND_FDO_VERSION = 1.8.3
+WPEBACKEND_FDO_VERSION = 1.9.92
 WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
 WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
 WPEBACKEND_FDO_INSTALL_STAGING = YES
