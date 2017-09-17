From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Sep 2017 18:31:08 +0200
Subject: [Buildroot] [git commit] package/libgcrypt: bump version to 1.8.1
Message-ID: <20170917162346.6EFC47F93D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=343db82cb2a4828e1f64e40fdba83d8e5f01fc05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha1 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgcrypt/libgcrypt.hash | 6 ++++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 56a45c5..8999db8 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,3 +1,5 @@
+# From https://www.gnupg.org/download/integrity_check.html
+sha1 dd35f00da45602afe81e01f4d60c40bbdd826fe6  libgcrypt-1.8.1.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.7.9.tar.bz2.sig
-sha256  bfe9bb703c1126c3647da2810fd23039c2f09d46969f71612c2065dc3fa9373b  libgcrypt-1.7.9.tar.bz2
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.1.tar.bz2.sig
+sha256  7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3  libgcrypt-1.8.1.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index fe3ac5c..fbbb831 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.9
+LIBGCRYPT_VERSION = 1.8.1
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
