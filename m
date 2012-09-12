From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Wed, 12 Sep 2012 08:58:14 +0100
Subject: [Buildroot] [PATCH] libgcrypt: add license information
Message-ID: <50504096.5030401@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mark Jackson <mpfj@newflow.co.uk>
---
 package/libgcrypt/libgcrypt.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index db5781b..a320e48 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -6,6 +6,8 @@

 LIBGCRYPT_VERSION = 1.5.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
+LIBGCRYPT_LICENSE = LGPLv2.1+
+LIBGCRYPT_LICENSE_FILES = COPYING.LIB
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES

-- 
1.7.9.5
