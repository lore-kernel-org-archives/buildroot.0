From: Daniel Mack <zonque@gmail.com>
Date: Mon, 11 Jul 2011 15:34:26 +0200
Subject: [Buildroot] [PATCH 1/2] libgcrypt: bump version to 1.5.0
Message-ID: <1310391267-19364-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/libgcrypt/libgcrypt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index a7163ea..8b08c3e 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBGCRYPT_VERSION = 1.4.6
+LIBGCRYPT_VERSION = 1.5.0
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_SITE = ftp://ftp.gnupg.org/gcrypt/libgcrypt
 LIBGCRYPT_INSTALL_STAGING = YES
-- 
1.7.5.4
