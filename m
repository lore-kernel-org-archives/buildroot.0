From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Jan 2018 12:39:17 +0200
Subject: [Buildroot] [PATCH 1/2] libgcrypt: bump to version 1.8.2
Message-ID: <652141f338b9b6c383dd9da7c409e10e5fbb9242.1515753558.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgcrypt/libgcrypt.hash | 7 ++++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 8999db8970fb..736332d3505c 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1 dd35f00da45602afe81e01f4d60c40bbdd826fe6  libgcrypt-1.8.1.tar.bz2
+sha1 ab8aae5d7a68f8e0988f90e11e7f6a4805af5c8d  libgcrypt-1.8.2.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.1.tar.bz2.sig
-sha256  7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3  libgcrypt-1.8.1.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.2.tar.bz2.sig
+sha256  c8064cae7558144b13ef0eb87093412380efa16c4ee30ad12ecb54886a524c07  libgcrypt-1.8.2.tar.bz2
+sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index fbbb83162e3a..00e864e836a2 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.8.1
+LIBGCRYPT_VERSION = 1.8.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.15.1
