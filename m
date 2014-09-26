From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 26 Sep 2014 20:23:15 -0300
Subject: [Buildroot] [PATCH] package: libarchive: allow building as host
	package
Message-ID: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It works correctly without any changes, so just enable it.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/libarchive/libarchive.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 8c6951d..22914c2 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -69,3 +69,4 @@ LIBARCHIVE_CONF_OPT += --without-zlib
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.1.0
