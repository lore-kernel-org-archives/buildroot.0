From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 20:54:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/websocketpp: add
 WEBSOCKETPP_CPE_ID_VENDOR
Message-ID: <20210128195458.4161975-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:zaphoyd:websocketpp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azaphoyd%3Awebsocketpp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/websocketpp/websocketpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
index 26595a00d3..59b365aa54 100644
--- a/package/websocketpp/websocketpp.mk
+++ b/package/websocketpp/websocketpp.mk
@@ -8,6 +8,7 @@ WEBSOCKETPP_VERSION = 0.8.2
 WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
 WEBSOCKETPP_LICENSE = BSD-3c, MIT, Zlib
 WEBSOCKETPP_LICENSE_FILES = COPYING
+WEBSOCKETPP_CPE_ID_VENDOR = zaphoyd
 WEBSOCKETPP_INSTALL_STAGING = YES
 # Only installs headers
 WEBSOCKETPP_INSTALL_TARGET = NO
-- 
2.29.2
