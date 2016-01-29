From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 29 Jan 2016 21:17:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump version to 6.500.4
Message-ID: <1454098625-9166-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch also fixes the broken download of the current package
version because upstream removed version 5.100.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/armadillo/armadillo.hash | 5 ++++-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 0046c56..4149a77 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,2 +1,5 @@
+# From http://sourceforge.net/projects/arma/files/?source=navbar
+md5	a39f27197d24b3d25437fab6bb1d118f		armadillo-6.500.4.tar.gz
+sha1	68166e67521a720c72917d196b0807bc6cab8b2e	armadillo-6.500.4.tar.gz
 # Locally computed:
-sha256  63150f12bf7c7c598ea55b7271d99fce349ff386a3dc2cae3904b244f6e35320  armadillo-5.100.2.tar.gz
+sha256	813de85fa61ba5077ed871d801ba7070d369e7e9742002e4c11474c75ff6d1c6	armadillo-6.500.4.tar.gz
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 8341ff6..813a41b 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 5.100.2
+ARMADILLO_VERSION = 6.500.4
 ARMADILLO_SITE = http://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.7.0.rc3
