From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 14:49:42 +0100
Subject: [Buildroot] [git commit] package/libksba: bump to version 1.5.0
Message-ID: <20201213133350.34101813B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4c58de3b5289744ceb20884f7888868df6f33f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of AUTHORS file (update in year and URL)
- Update indentation in hash file

https://dev.gnupg.org/T5146
https://dev.gnupg.org/T4943

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libksba/libksba.hash | 12 ++++++------
 package/libksba/libksba.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 8ab7e6efe8..c8c9d6bdd7 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,9 +1,9 @@
 # Locally calculated after checking pgp signature
-sha256	41444fd7a6ff73a79ad9728f985e71c9ba8cd3e5e53358e70d5f066d35c1a340	libksba-1.3.5.tar.bz2
+sha256  ae4af129216b2d7fdea0b5bf2a788cd458a79c983bb09a43f4d525cc87aba0ba  libksba-1.5.0.tar.bz2
 
 # Hash for license files:
-sha256	240908e1356ffeb5d0730227b6198dcc8e878375d28632fd813e0ed75b35ccc2	AUTHORS
-sha256	6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076	COPYING
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING.GPLv2
-sha256	0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf	COPYING.GPLv3
-sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	COPYING.LGPLv3
+sha256  4d7ff8486176da695f3c81da2ac7ce1b9e5331e0a1667d9ebfe44057088a4220  AUTHORS
+sha256  6197b98c6bf69838c624809c509d84333de1bc847155168c0e84527446a27076  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
+sha256  0abbff814cd00e2b0b6d08395af2b419c1a92026c4b4adacbb65ccda45fa58cf  COPYING.GPLv3
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LGPLv3
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 25b17a47da..b2f4db6b62 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.3.5
+LIBKSBA_VERSION = 1.5.0
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
