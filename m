From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Jul 2019 14:00:58 +0300
Subject: [Buildroot] [PATCH 1/2] package/libgpg-error: bump to version 1.36
Message-ID: <4cb93f2380a041102fa48a2f9b899c281a2f95c3.1564484459.git.baruch@tkos.co.il>
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
index 1b1ea4e7ef8f..2169182f60d9 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.35.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.36.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb791f9f997d07e067  libgpg-error-1.35.tar.bz2
+sha256 babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c  libgpg-error-1.36.tar.bz2
 # Locally calculated
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index f081ee48131b..95f5988770ef 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.35
+LIBGPG_ERROR_VERSION = 1.36
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
-- 
2.20.1
