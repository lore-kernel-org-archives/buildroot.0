From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Feb 2021 19:22:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/privoxy: add PRIVOXY_CPE_ID_VENDOR
Message-ID: <20210201182227.993194-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:privoxy:privoxy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aprivoxy%3Aprivoxy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/privoxy/privoxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/privoxy/privoxy.mk b/package/privoxy/privoxy.mk
index 3cf1dc9754..6f10d5d32e 100644
--- a/package/privoxy/privoxy.mk
+++ b/package/privoxy/privoxy.mk
@@ -12,5 +12,6 @@ PRIVOXY_AUTORECONF = YES
 PRIVOXY_DEPENDENCIES = pcre zlib
 PRIVOXY_LICENSE = GPL-2.0+
 PRIVOXY_LICENSE_FILES = LICENSE
+PRIVOXY_CPE_ID_VENDOR = privoxy
 
 $(eval $(autotools-package))
-- 
2.29.2
