From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Dec 2016 10:28:20 -0300
Subject: [Buildroot] [PATCH] libgcrypt: bump to version 1.7.5
Message-ID: <20161230132820.8946-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 885f831..89c5719 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2016-08/msg00008.html
-sha1 5a034291e7248592605db448481478e6c963aa9c  libgcrypt-1.7.3.tar.bz2
+# From https://lists.gnu.org/archive/html/info-gnu/2016-12/msg00007.html
+sha1 fa485d854748fc06ea041b3057b2de2f12fbc17f  libgcrypt-1.7.5.tar.bz2
 # Calculated based on the hash above
-sha256 ddac6111077d0a1612247587be238c5294dd0ee4d76dc7ba783cc55fb0337071  libgcrypt-1.7.3.tar.bz2
+sha256 d1fea4128beef2bb30a470af6bafabccc503ced350534fb9dd8f5a53ffbae800  libgcrypt-1.7.5.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 31f4d6c..48c62b4 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.7.3
+LIBGCRYPT_VERSION = 1.7.5
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
2.10.2
