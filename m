From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 23:28:57 +0100
Subject: [Buildroot] [git commit] package/glibc: bump to version
 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
Message-ID: <20201229221233.05DF88353E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=182ea9477b04806c71cf578cde4718d691904428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://sourceware.org/pipermail/libc-announce/2020/000029.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../glibc.hash                                                          | 2 +-
 package/glibc/glibc.mk                                                  | 2 +-
 .../0001-HACK-only-build-and-install-localedef.patch                    | 0
 .../0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch      | 0
 .../localedef.hash                                                      | 2 +-
 package/localedef/localedef.mk                                          | 2 +-
 6 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash b/package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
similarity index 70%
rename from package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
rename to package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
index a1b2ae12fd..45ecc2895f 100644
--- a/package/glibc/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/glibc.hash
+++ b/package/glibc/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
+sha256  04946bb7cbaf4062bf5e727e0d6784e105b07611587d71f00d25ea896753c26d  glibc-2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d51dce89f5..5cc20e763b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -20,7 +20,7 @@ else ifeq ($(BR2_RISCV_32),y)
 # Until 2.33 is released, just use master
 GLIBC_VERSION = 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99
 else
-GLIBC_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
+GLIBC_VERSION = 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
 endif
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
similarity index 70%
rename from package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
rename to package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
index a1b2ae12fd..45ecc2895f 100644
--- a/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
+++ b/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
+sha256  04946bb7cbaf4062bf5e727e0d6784e105b07611587d71f00d25ea896753c26d  glibc-2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 413e3acb65..d75702d847 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
+LOCALEDEF_VERSION = 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
