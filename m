From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Apr 2021 21:27:29 +0200
Subject: [Buildroot] [git commit] package/localedef: bump to version 2.32-23
Message-ID: <20210426191014.50A1781730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dbf78bce1e3a12b8aaa2d1437a28c451fee51b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

resync the version with glibc package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-HACK-only-build-and-install-localedef.patch                    | 0
 .../0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch      | 0
 .../localedef.hash                                                      | 2 +-
 package/localedef/localedef.mk                                          | 2 +-
 4 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
similarity index 72%
rename from package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
rename to package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
index 45ecc2895f..b1d5243fcc 100644
--- a/package/localedef/2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2/localedef.hash
+++ b/package/localedef/2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  04946bb7cbaf4062bf5e727e0d6784e105b07611587d71f00d25ea896753c26d  glibc-2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2.tar.gz
+sha256  f4710e9a435a7b83e1d23dd75434f0d36b898eba9b4249c946c32b467d852fd4  glibc-2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index d75702d847..57ab5a3458 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.32-23-g050022910be1d1f5c11cd5168f1685ad4f9580d2
+LOCALEDEF_VERSION = 2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
