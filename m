From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:01 +0100
Subject: [Buildroot] [git commit] package/nginx: add NGINX_CPE_ID_VENDOR
Message-ID: <20210118203943.4934C88530@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f178e0103b7b0a894f4a51cde407aa040df1ba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:nginx:nginx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anginx%3Anginx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
