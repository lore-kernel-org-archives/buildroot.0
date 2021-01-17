From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 15:11:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: add OPENJPEG_CPE_ID_VENDOR
Message-ID: <20210117141138.345507-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:uclouvain:openjpeg is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Auclouvain%3Aopenjpeg

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openjpeg/openjpeg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index 688f5c8fec..b5d433df32 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -8,6 +8,7 @@ OPENJPEG_VERSION = 2.4.0
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
+OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_OPENJPEG_CODEC),y)
-- 
2.29.2
