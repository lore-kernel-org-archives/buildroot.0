From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 16:13:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/transmission: add
 TRANSMISSION_CPE_ID_VENDOR
Message-ID: <20210303151315.503992-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:transmissionbt:transmission is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atransmissionbt%3Atransmission

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/transmission/transmission.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index ff3b41c328..1660d2c2b9 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -20,6 +20,7 @@ TRANSMISSION_CONF_OPTS = \
 	--enable-lightweight
 TRANSMISSION_LICENSE = GPL-2.0 or GPL-3.0 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
+TRANSMISSION_CPE_ID_VENDOR = transmissionbt
 
 ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
 TRANSMISSION_DEPENDENCIES += libminiupnpc
-- 
2.30.0
