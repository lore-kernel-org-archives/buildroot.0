From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Jun 2017 21:35:40 +0300
Subject: [Buildroot] [PATCH] libnpth: bump to version 1.5
Message-ID: <1bc9d1bfc0dee1f95d37ec761f7422778412b530.1497465340.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to HTTPS for better corporate firewall compliance.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libnpth/libnpth.hash | 4 ++--
 package/libnpth/libnpth.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index d8d0fbd51d2d..f8cfefa44880 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 bca81940436aed0734eb8d0ff8b179e04cc8c087f5625204419f5f45d736a82a  npth-1.3.tar.bz2
+# Locally calculated after checking signature
+sha256 294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd9db3c2  npth-1.5.tar.bz2
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 35111ddf12ad..dcaf8685ae1a 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.3
+LIBNPTH_VERSION = 1.5
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
-LIBNPTH_SITE = ftp://ftp.gnupg.org/gcrypt/npth
+LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-3.0+ or GPL-2.0+
 LIBNPTH_LICENSE_FILES = COPYING COPYING.LESSER
 LIBNPTH_INSTALL_STAGING = YES
-- 
2.11.0
