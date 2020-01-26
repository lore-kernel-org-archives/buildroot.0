From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2020 09:06:22 +0100
Subject: [Buildroot] [git commit] package/localedef: bump to version 2.30
Message-ID: <20200126075908.F3E2583A31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5834f801b66a4724fad2192a43abbe624044986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the same version as for glibc package.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-HACK-only-build-and-install-localedef.patch                    | 0
 .../localedef.hash                                                      | 2 +-
 package/localedef/localedef.mk                                          | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch
similarity index 100%
rename from package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0001-HACK-only-build-and-install-localedef.patch
diff --git a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
similarity index 70%
rename from package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash
rename to package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
index b62487ce19..4283ea04b4 100644
--- a/package/localedef/2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436/localedef.hash
+++ b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a5d4cbe7eceaefd8bce1104994379818169961b59346d2f3897966912237b1e6  glibc-2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436.tar.gz
+sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4005737434..10a1929044 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.29-11-ge28ad442e73b00ae2047d89c8cc7f9b2a0de5436
+LOCALEDEF_VERSION = 2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 LOCALEDEF_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
