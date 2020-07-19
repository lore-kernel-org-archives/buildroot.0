From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2020 08:09:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgcrypt: bump version to 1.8.6
Message-ID: <20200719060939.48742-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000445.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libgcrypt/libgcrypt.hash | 8 ++++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 580bdf331f..c8aae17c18 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000440.html
-sha1 2d8781e92f88706707a1e76fb628b499ad538a30  libgcrypt-1.8.5.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2020q3/000445.html
+sha1  406b02873833427898d16bcc8483bc5c91c73d4a  libgcrypt-1.8.6.tar.bz2
 # Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.5.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.6.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3  libgcrypt-1.8.5.tar.bz2
+sha256  0cba2700617b99fc33864a0c16b1fa7fdf9781d9ed3509f5d767178e5fd7b975  libgcrypt-1.8.6.tar.bz2
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index d21513bd39..b2c1ea3cbe 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.8.5
+LIBGCRYPT_VERSION = 1.8.6
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.27.0
