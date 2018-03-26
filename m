From: Alexander Dahl <post@lespocky.de>
Date: Mon, 26 Mar 2018 09:18:44 +0200
Subject: [Buildroot] [PATCH] libfcgi: Use SPDX license identifier
Message-ID: <20180326071844.10134-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The fcgi license is covered by SPDX, the identifier however is not
obvious.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/libfcgi/libfcgi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfcgi/libfcgi.mk b/package/libfcgi/libfcgi.mk
index ced850c153..78da772916 100644
--- a/package/libfcgi/libfcgi.mk
+++ b/package/libfcgi/libfcgi.mk
@@ -7,7 +7,7 @@
 LIBFCGI_VERSION = 2.4.0
 LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
 LIBFCGI_SITE = http://www.fastcgi.com/dist
-LIBFCGI_LICENSE = fcgi license
+LIBFCGI_LICENSE = OML
 LIBFCGI_LICENSE_FILES = LICENSE.TERMS
 LIBFCGI_INSTALL_STAGING = YES
 LIBFCGI_AUTORECONF = YES
-- 
2.11.0
