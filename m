From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 08:42:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/hiredis: add HIREDIS_CPE_ID_VENDOR
Message-ID: <20210115074238.2076460-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:redislabs:hiredis is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredislabs%3Ahiredis

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 27a26661cf..f340fb8a4d 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -9,6 +9,7 @@ HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
+HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
 HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
 
-- 
2.29.2
