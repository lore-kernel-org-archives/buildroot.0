From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Jun 2017 15:08:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/gsl: bump version to 2.3
Message-ID: <20170604130806.30143-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gsl/gsl.hash | 2 +-
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index bc33e4e2d..f7b1d5338 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	73bc2f51b90d2a780e6d266d43e487b3dbd78945dd0b04b14ca5980fe28d2f53	gsl-1.16.tar.gz
+sha256 562500b789cd599b3a4f88547a7a3280538ab2ff4939504c8b4ac4ca25feadfb  gsl-2.3.tar.gz
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 3dd49044a..41379f433 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 1.16
+GSL_VERSION = 2.3
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
-- 
2.11.0
