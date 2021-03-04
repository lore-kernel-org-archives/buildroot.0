From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:29:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: add
 LIBMICROHTTPD_CPE_ID_VENDOR
Message-ID: <20210304112941.1235794-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:libmicrohttpd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alibmicrohttpd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmicrohttpd/libmicrohttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index e3469df423..6eee597c34 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -7,6 +7,7 @@
 LIBMICROHTTPD_VERSION = 0.9.72
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
+LIBMICROHTTPD_CPE_ID_VENDOR = gnu
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
-- 
2.30.0
