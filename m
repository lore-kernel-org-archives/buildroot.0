From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  8 Dec 2017 06:21:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump version to 1.0.2
Message-ID: <20171208052131.14008-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.hash | 5 +++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 1cb9d8d3c8..9a35c5dafb 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,3 @@
-# From http://get.videolan.org/libbluray/1.0.1/libbluray-1.0.1.tar.bz2.sha512
-sha512 798d38cc95af87599af5838e5c288f2536a73b33191db8ff3774cf7eb5b835006bea83693f016d47dff551001b98527d8b1f14051f673fb3b28073b820e325d7  libbluray-1.0.1.tar.bz2
+# From http://get.videolan.org/libbluray/1.0.2/libbluray-1.0.2.tar.bz2.sha512
+sha512 e1360ad08aa6cc67a80efa81a09004faebbe31105f1961494f82f655e3e7378b198ee3bc534b0d0c2bfec726939b11b545cc8bbfa30794fc647432dadf71089b  libbluray-1.0.2.tar.bz2
+sha256 b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 4928f8acb8..3d7ce351c1 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.0.1
+LIBBLURAY_VERSION = 1.0.2
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
-- 
2.11.0
