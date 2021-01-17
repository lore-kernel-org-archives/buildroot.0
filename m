From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:09:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libndp: add LIBNDP_CPE_ID_VENDOR
Message-ID: <20210117160909.351459-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libndp:libndp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibndp%3Alibndp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libndp/libndp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 3783eb135a..eb1f7f0c80 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -8,6 +8,7 @@ LIBNDP_VERSION = 1.7
 LIBNDP_SITE = $(call github,jpirko,libndp,v$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
+LIBNDP_CPE_ID_VENDOR = libndp
 LIBNDP_AUTORECONF = YES
 LIBNDP_INSTALL_STAGING = YES
 
-- 
2.29.2
