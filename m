From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  6 Jul 2017 19:54:56 +0200
Subject: [Buildroot] [PATCH] libtomcrypt: bump to version 1.18.0-rc1
Message-ID: <20170706175456.11742-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libtomcrypt/libtomcrypt.hash | 2 +-
 package/libtomcrypt/libtomcrypt.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libtomcrypt/libtomcrypt.hash b/package/libtomcrypt/libtomcrypt.hash
index 562016d5..932052e8 100644
--- a/package/libtomcrypt/libtomcrypt.hash
+++ b/package/libtomcrypt/libtomcrypt.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  e33b47d77a495091c8703175a25c8228aff043140b2554c08a3c3cd71f79d116  crypt-1.17.tar.bz2
+sha256  943af136e6c624371659dc6c98a2d749ea45912628717b72e4f8894339709b20  crypt-1.18.0-rc1.tar.xz
diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index 8cc02b28..ee0c68e8 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBTOMCRYPT_VERSION = 1.17
-LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/$(LIBTOMCRYPT_VERSION)
-LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.bz2
+LIBTOMCRYPT_VERSION = 1.18.0-rc1
+LIBTOMCRYPT_SITE = https://github.com/libtom/libtomcrypt/releases/download/v$(LIBTOMCRYPT_VERSION)
+LIBTOMCRYPT_SOURCE = crypt-$(LIBTOMCRYPT_VERSION).tar.xz
 LIBTOMCRYPT_LICENSE = WTFPL
 LIBTOMCRYPT_LICENSE_FILES = LICENSE
 LIBTOMCRYPT_INSTALL_STAGING = YES
-- 
2.11.0
