From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 28 Feb 2015 08:09:12 -0300
Subject: [Buildroot] [PATCH 1/2] libgcrypt: security bump to version 1.6.3
Message-ID: <1425121753-25802-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2014-3591 - Use ciphertext blinding for Elgamal decryption
CVE-2015-0837 - Fixed data-dependent timing variations in modular
exponentiation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgcrypt/libgcrypt.hash | 4 ++--
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 2ce7a67..9cad1c4 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,2 +1,2 @@
-# From http://lists.gnupg.org/pipermail/gnupg-announce/2014q3/000355.html
-sha1	cc31aca87e4a3769cb86884a3f5982b2cc8eb7ec	libgcrypt-1.6.2.tar.bz2
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q1/000364.html
+sha1	9456e7b64db9df8360a1407a38c8c958da80bbf1	libgcrypt-1.6.3.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 4d64da8..e2a4b39 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.6.2
+LIBGCRYPT_VERSION = 1.6.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.0.5
