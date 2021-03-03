From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 10:20:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/libmodplug: add
 LIBMODPLUG_CPE_ID_VENDOR
Message-ID: <20210303092045.467923-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:konstanty_bialkowski:libmodplug is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Akonstanty_bialkowski%3Alibmodplug

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodplug/libmodplug.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 05786ce812..98c38a3b00 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -9,5 +9,6 @@ LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodpl
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
 LIBMODPLUG_LICENSE_FILES = COPYING
+LIBMODPLUG_CPE_ID_VENDOR = konstanty_bialkowski
 
 $(eval $(autotools-package))
-- 
2.30.0
