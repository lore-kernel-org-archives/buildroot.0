From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 22:52:17 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/armadillo: bump version to
	7.900.1
Message-ID: <20170528205217.27675-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changed upstream URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/armadillo/armadillo.hash | 6 +++---
 package/armadillo/armadillo.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 4149a777d..38fafa8c7 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,5 +1,5 @@
 # From http://sourceforge.net/projects/arma/files/?source=navbar
-md5	a39f27197d24b3d25437fab6bb1d118f		armadillo-6.500.4.tar.gz
-sha1	68166e67521a720c72917d196b0807bc6cab8b2e	armadillo-6.500.4.tar.gz
+md5 5ef71763bd429a3d481499878351f3be armadillo-7.900.1.tar.xz
+sha1 8118faf1c6a7a39c55a1103a1f90e85e613cc377 armadillo-7.900.1.tar.xz
 # Locally computed:
-sha256	813de85fa61ba5077ed871d801ba7070d369e7e9742002e4c11474c75ff6d1c6	armadillo-6.500.4.tar.gz
+sha256 33eec7013990b5477ccc5ad3abc68bc2326c7a7a2790014d625cfcf37c0e07d3  armadillo-7.900.1.tar.xz
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 714c1b2dd..b5fe403a7 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 6.500.4
-ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
+ARMADILLO_VERSION = 7.900.1
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
+ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = MPL-2.0
-- 
2.11.0
