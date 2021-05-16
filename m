From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 12:55:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: add
 KEEPALIVED_CPE_ID_VENDOR
Message-ID: <20210516105528.3773040-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:keepalived:keepalived is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akeepalived%3Akeepalived

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 1a42d0c880..5d42cab741 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -9,6 +9,7 @@ KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
+KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
-- 
2.30.2
