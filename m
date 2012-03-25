From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 25 Mar 2012 14:27:16 +0200
Subject: [Buildroot] [PATCH v1 1/1] openssl : bump version from 1.0.0h to
	1.0.1
Message-ID: <1332678436-25946-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/openssl/openssl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index a304747..7ee7aa5 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSL_VERSION = 1.0.0h
+OPENSSL_VERSION = 1.0.1
 OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
-- 
1.7.9.3
