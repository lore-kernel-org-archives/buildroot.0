From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  3 Jul 2018 08:08:09 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: bump to version 1.18.2
Message-ID: <20180703060809.22073-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtomcrypt/libtomcrypt.hash | 5 ++++-
 package/libtomcrypt/libtomcrypt.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.hash b/package/libtomcrypt/libtomcrypt.hash
index be8e9b1bc..3820f8d72 100644
--- a/package/libtomcrypt/libtomcrypt.hash
+++ b/package/libtomcrypt/libtomcrypt.hash
@@ -1,2 +1,5 @@
 # Locally computed
-sha256  57c13a34fbfd45696189d19e47864e48f4e5c11590c29b444accb8edbf047f14  crypt-1.18.1.tar.xz
+sha256  96ad4c3b8336050993c5bc2cf6c057484f2b0f9f763448151567fbab5e767b84  crypt-1.18.2.tar.xz
+
+# Hash for license file:
+sha256  8f196cb13afd271f5e267fd29543fc454596382ad580e7592709492843996ac8  LICENSE
diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index ff6222cc9..583bcb15f 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTOMCRYPT_VERSION = 1.18.1
+LIBTOMCRYPT_VERSION = 1.18.2
 LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/v$(LIBTOMCRYPT_VERSION)
 LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.xz
 LIBTOMCRYPT_LICENSE = WTFPL
-- 
2.17.1
