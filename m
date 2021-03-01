From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Mar 2021 18:42:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/putty: add PUTTY_CPE_ID_VENDOR
Message-ID: <20210301174239.206851-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:putty:putty is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aputty%3Aputty

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/putty/putty.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 8f9564bc38..c40cac9dc5 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -8,6 +8,7 @@ PUTTY_VERSION = 0.74
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
+PUTTY_CPE_ID_VENDOR = putty
 PUTTY_CONF_OPTS = --disable-gtktest
 PUTTY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
-- 
2.30.0
