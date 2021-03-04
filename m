From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:27:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/libosip2: add CPE variables
Message-ID: <20210304112726.1235489-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:osip is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aosip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libosip2/libosip2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index d28027c135..b86a72479e 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -9,6 +9,8 @@ LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 LIBOSIP2_LICENSE = LGPL-2.1+
 LIBOSIP2_LICENSE_FILES = COPYING
+LIBOSIP2_CPE_ID_VENDOR = gnu
+LIBOSIP2_CPE_ID_PRODUCT = osip
 
 ifeq ($(BR2_arc),y)
 # toolchain __arc__ define conflicts with libosip2 source
-- 
2.30.0
