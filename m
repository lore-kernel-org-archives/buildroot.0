From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 15:17:31 -0000
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.3.0
Message-ID: <20210607144651.652E68B848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1068ee78b8f42000055c1e7f980a7e5ab26bc902
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed backported patch.

Changelog:
https://code.videolan.org/videolan/libbluray/-/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.hash | 4 ++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 430d477484..4ab8c85866 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.2.1/libbluray-1.2.1.tar.bz2.sha512
-sha512  e9eeee433034266e88c05ae3469c0bd2bf700d7f16e17ad706f48426c143c823e83c16ab79a637f1e85e4eb858aa0577630671f87ba35d179db2a1d8bc8545c4  libbluray-1.2.1.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbluray/1.3.0/libbluray-1.3.0.tar.bz2.sha512
+sha512  3d5145e6fd7de099c07f937282112c7abb12a5590b7c0b965b00bddee3837ddfd1a30076aaa6d6278d07a5beee3856f602125983ae075ab30eceb6ac1bd9bcdc  libbluray-1.3.0.tar.bz2
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 36f59190b1..5c5f603dd8 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.2.1
+LIBBLURAY_VERSION = 1.3.0
 LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
