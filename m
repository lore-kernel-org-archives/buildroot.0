From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:57:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/nginx: add NGINX_CPE_ID_VENDOR
Message-ID: <20210117165734.355387-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nginx:nginx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anginx%3Anginx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/nginx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index fb06108ab3..9c32546835 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -8,6 +8,7 @@ NGINX_VERSION = 1.18.0
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
+NGINX_CPE_ID_VENDOR = nginx
 NGINX_DEPENDENCIES = host-pkgconf
 
 NGINX_CONF_OPTS = \
-- 
2.29.2
