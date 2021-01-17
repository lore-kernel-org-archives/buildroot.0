From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 19:08:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/jquery: add JQUERY_CPE_ID_VENDOR
Message-ID: <20210117180852.367541-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:jquery:jquery is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajquery%3Ajquery

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jquery/jquery.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jquery/jquery.mk b/package/jquery/jquery.mk
index 88ab84fa05..8febed36ca 100644
--- a/package/jquery/jquery.mk
+++ b/package/jquery/jquery.mk
@@ -8,6 +8,7 @@ JQUERY_VERSION = 3.5.1
 JQUERY_SITE = http://code.jquery.com
 JQUERY_SOURCE = jquery-$(JQUERY_VERSION).min.js
 JQUERY_LICENSE = MIT
+JQUERY_CPE_ID_VENDOR = jquery
 
 define JQUERY_EXTRACT_CMDS
 	cp $(JQUERY_DL_DIR)/$(JQUERY_SOURCE) $(@D)
-- 
2.29.2
