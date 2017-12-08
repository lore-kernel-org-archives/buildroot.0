From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Dec 2017 08:40:38 +0100
Subject: [Buildroot] [git commit] package/libbluray: bump version to 1.0.2
Message-ID: <20171208073339.6DA6F80F56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7dd886d56f505fbb31ff813953543c19b520c32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbluray/libbluray.hash | 5 +++--
 package/libbluray/libbluray.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index 1cb9d8d..9a35c5d 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,2 +1,3 @@
-# From http://get.videolan.org/libbluray/1.0.1/libbluray-1.0.1.tar.bz2.sha512
-sha512 798d38cc95af87599af5838e5c288f2536a73b33191db8ff3774cf7eb5b835006bea83693f016d47dff551001b98527d8b1f14051f673fb3b28073b820e325d7  libbluray-1.0.1.tar.bz2
+# From http://get.videolan.org/libbluray/1.0.2/libbluray-1.0.2.tar.bz2.sha512
+sha512 e1360ad08aa6cc67a80efa81a09004faebbe31105f1961494f82f655e3e7378b198ee3bc534b0d0c2bfec726939b11b545cc8bbfa30794fc647432dadf71089b  libbluray-1.0.2.tar.bz2
+sha256 b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 4928f8a..3d7ce35 100644
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
