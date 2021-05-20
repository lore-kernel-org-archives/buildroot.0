From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 May 2021 21:15:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: add CPE variables
Message-ID: <20210520191534.182725-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:exosip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aexosip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libeXosip2/libeXosip2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index dba2b63a02..3ed637a3d4 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -11,6 +11,8 @@ LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
 LIBEXOSIP2_INSTALL_STAGING = YES
 LIBEXOSIP2_LICENSE = GPL-2.0+
 LIBEXOSIP2_LICENSE_FILES = COPYING
+LIBEXOSIP2_CPE_ID_VENDOR = gnu
+LIBEXOSIP2_CPE_ID_PRODUCT = exosip
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
-- 
2.30.2
