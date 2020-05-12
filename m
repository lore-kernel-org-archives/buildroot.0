From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 13:57:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/localedef: bump
 version to stay in sync with glibc
Message-ID: <20200512114220.A1B6A8F360@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0edff95ebd84cfcfcee8d0204e57bfc92e619c0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a388d7443e89b1ba7701785efd8a9c777db2c6f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-HACK-only-build-and-install-localedef.patch                    | 0
 .../0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch      | 0
 .../0003-localedef-Use-initializer-for-flexible-array-member-.patch     | 0
 .../localedef.hash                                                      | 2 +-
 package/localedef/localedef.mk                                          | 2 +-
 5 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 100%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/0003-localedef-Use-initializer-for-flexible-array-member-.patch
similarity index 100%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
rename to package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/0003-localedef-Use-initializer-for-flexible-array-member-.patch
diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
similarity index 70%
rename from package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
rename to package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
index 4283ea04b4..6677d32db9 100644
--- a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
+++ b/package/localedef/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
+sha256  4462f56696332efbc5b0c2f86d7aa75a2a02c3d44bc4345fa42b5bab1225de5c  glibc-2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 1093e106fa..f6e26b5666 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
+LOCALEDEF_VERSION = 2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
