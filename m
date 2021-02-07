From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 21:35:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: add AVAHI_CPE_ID_VENDOR
Message-ID: <20210207203515.3154710-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:avahi:avahi is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aavahi%3Aavahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avahi/avahi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index eef05f0d2f..e2b27328cd 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -8,6 +8,7 @@ AVAHI_VERSION = 0.8
 AVAHI_SITE = https://github.com/lathiat/avahi/releases/download/v$(AVAHI_VERSION)
 AVAHI_LICENSE = LGPL-2.1+
 AVAHI_LICENSE_FILES = LICENSE
+AVAHI_CPE_ID_VENDOR = avahi
 AVAHI_INSTALL_STAGING = YES
 
 AVAHI_CONF_ENV = \
-- 
2.29.2
