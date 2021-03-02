From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 10:25:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/rdesktop: add RDESKTOP_CPE_ID_VENDOR
Message-ID: <20210302092531.269814-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:rdesktop:rdesktop is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ardesktop%3Ardesktop

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rdesktop/rdesktop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index 672d85b5c5..5a1739a46e 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -24,6 +24,7 @@ RDESKTOP_DEPENDENCIES = \
 RDESKTOP_CONF_OPTS = --disable-credssp
 RDESKTOP_LICENSE = GPL-3.0+
 RDESKTOP_LICENSE_FILES = COPYING
+RDESKTOP_CPE_ID_VENDOR = rdesktop
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
 RDESKTOP_DEPENDENCIES += pcsc-lite
-- 
2.30.0
