From: Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 30 Apr 2013 20:21:53 +0400
Subject: [Buildroot] [PATCH] libgcrypt: bump to version 1.5.2
Message-ID: <1367338913-18810-1-git-send-email-fenixk19@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 package/libgcrypt/libgcrypt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index b0a8a73..7870913 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBGCRYPT_VERSION = 1.5.0
+LIBGCRYPT_VERSION = 1.5.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
-- 
1.7.2.5
