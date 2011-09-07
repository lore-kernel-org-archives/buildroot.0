From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 07 Sep 2011 10:51:47 +0200
Subject: [Buildroot] [PATCH] openssl: bump to 1.0.0e
Message-ID: <4E6730A3.6010504@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/openssl/openssl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/openssl/openssl.mk
===================================================================
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0d
+OPENSSL_VERSION = 1.0.0e
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
