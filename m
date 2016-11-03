From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  3 Nov 2016 09:53:13 +0200
Subject: [Buildroot] [PATCH] libcurl: move site to https
Message-ID: <5f12f7953ffa20c0fdfe34227fad9d298b2b7ba9.1478159593.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Saves a redirect.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index d60000aaedb8..197e0b579d47 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -6,7 +6,7 @@
 
 LIBCURL_VERSION = 7.51.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
-LIBCURL_SITE = http://curl.haxx.se/download
+LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_LIBIDN),libidn) \
-- 
2.10.1
