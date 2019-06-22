From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Jun 2019 19:36:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: bump version to 1.1.2
Message-ID: <20190622173623.32617-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://code.videolan.org/videolan/libbluray/blob/master/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.hash | 5 +++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 9a35c5dafb..1757192b00 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,3 +1,4 @@
-# From http://get.videolan.org/libbluray/1.0.2/libbluray-1.0.2.tar.bz2.sha512
-sha512 e1360ad08aa6cc67a80efa81a09004faebbe31105f1961494f82f655e3e7378b198ee3bc534b0d0c2bfec726939b11b545cc8bbfa30794fc647432dadf71089b  libbluray-1.0.2.tar.bz2
+# From http://get.videolan.org/libbluray/1.1.2/libbluray-1.1.2.tar.bz2.sha512
+sha512 5a82af6c1840a1dcb31d06d90203c68e2c4f0bbadc9212eb0bb2776d42b0ab3793a769ebe07b3051be151e8b15876874d5a0658292f72b7126dd915a1ada3fe7  libbluray-1.1.2.tar.bz2
+# Locally computed
 sha256 b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 3d7ce351c1..49ee933d0a 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.0.2
+LIBBLURAY_VERSION = 1.1.2
 LIBBLURAY_SITE = http://get.videolan.org/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
-- 
2.20.1
