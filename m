From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:08:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/liboping: add LIBOPING_CPE_ID_VENDOR
Message-ID: <20210516170805.3986-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:noping:liboping is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anoping%3Aliboping

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liboping/liboping.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
index 4aa3e30ee8..a4541cb3bf 100644
--- a/package/liboping/liboping.mk
+++ b/package/liboping/liboping.mk
@@ -11,6 +11,7 @@ LIBOPING_INSTALL_STAGING = YES
 LIBOPING_CONF_OPTS = --without-perl-bindings
 LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
 LIBOPING_LICENSE_FILES = COPYING
+LIBOPING_CPE_ID_VENDOR = noping
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 LIBOPING_DEPENDENCIES += ncurses
-- 
2.30.2
