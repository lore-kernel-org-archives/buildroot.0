From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 27 Jan 2017 10:51:39 +0100
Subject: [Buildroot] [PATCH] package/libgcrypt: bump to version 1.7.6
Message-ID: <20170127095139.12911-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No announcement was made for this version, so the hash was calculated locally.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libgcrypt/libgcrypt.hash | 6 ++----
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 89c5719b5..48bbd6af5 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,2 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2016-12/msg00007.html
-sha1 fa485d854748fc06ea041b3057b2de2f12fbc17f  libgcrypt-1.7.5.tar.bz2
-# Calculated based on the hash above
-sha256 d1fea4128beef2bb30a470af6bafabccc503ced350534fb9dd8f5a53ffbae800  libgcrypt-1.7.5.tar.bz2
+# Locally calculated
+sha256  626aafee84af9d2ce253d2c143dc1c0902dda045780cc241f39970fc60be05bc  libgcrypt-1.7.6.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 48c62b4e5..a034358b3 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.5
+LIBGCRYPT_VERSION = 1.7.6
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.11.0
