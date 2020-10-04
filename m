From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 11:46:54 +0200
Subject: [Buildroot] [git commit] package/localedef: bump to glibc-2.31-54
Message-ID: <20201004094312.EDE638D696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d03f5a4dda29bf16a8ba00f44fd9da5b3e660958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

resync the version with glibc package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-HACK-only-build-and-install-localedef.patch                    | 0
 .../0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch      | 0
 .../localedef.hash                                                      | 2 +-
 package/localedef/localedef.mk                                          | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/localedef.hash b/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
similarity index 70%
rename from package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/localedef.hash
rename to package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
index 01c48b74b5..a1b2ae12fd 100644
--- a/package/localedef/2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e/localedef.hash
+++ b/package/localedef/2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a105837271b66e92f1ed4a5f10f3bb9e993842d592f67d352c6637126bd3d58c  glibc-2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e.tar.gz
+sha256  e1f2c9b424a4e0c00e7ad123a4204f7bc8afd3c504aeb8c79b1086509fd67176  glibc-2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 8eefb84a29..413e3acb65 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.31-49-g6f3459f9859a7b506c64fa1823769ab631072c6e
+LOCALEDEF_VERSION = 2.31-54-g6fdf971c9dbf7dac9bea552113fe4694015bbc4d
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
