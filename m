From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 12:23:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/enscript: add ENSCRIPT_CPE_ID_VENDOR
Message-ID: <20210516102333.3770984-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:enscript is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Aenscript

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/enscript/enscript.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
index fbc9e69dae..441ae3dad4 100644
--- a/package/enscript/enscript.mk
+++ b/package/enscript/enscript.mk
@@ -8,6 +8,7 @@ ENSCRIPT_VERSION = 1.6.6
 ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript
 ENSCRIPT_LICENSE = GPL-3.0+
 ENSCRIPT_LICENSE_FILES = COPYING
+ENSCRIPT_CPE_ID_VENDOR = gnu
 
 # Enable pthread threads if toolchain supports threads
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.30.2
