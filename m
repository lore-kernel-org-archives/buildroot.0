From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  4 May 2018 08:01:41 +0300
Subject: [Buildroot] [PATCH 2/3] libgpg-error: bump to version 1.31
In-Reply-To: <2659cc021a076d8ed583a0bf432ffbfa75f2655b.1525410102.git.baruch@tkos.co.il>
References: <2659cc021a076d8ed583a0bf432ffbfa75f2655b.1525410102.git.baruch@tkos.co.il>
Message-ID: <4f7d89a42c9e0608e79ed2780b83a9cd6a6b16d4.1525410102.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 0e6304de6677..608f9c62d710 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.29.tar.bz2.sig
-sha256 ece926fa5719d17a7ad8da618712cfa2f8a796ab2f2af9d544c5bb093383b1ea  libgpg-error-1.29.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.31.tar.bz2.sig
+sha256 40d0a823c9329478063903192a1f82496083b277265904878f4bc09e0db7a4ef  libgpg-error-1.31.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 862cb44eefed..aed5a517b0a5 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.29
+LIBGPG_ERROR_VERSION = 1.31
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.17.0
