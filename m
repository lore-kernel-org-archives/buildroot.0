From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Jan 2021 08:07:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/libbluray: add
 LIBBLURAY_CPE_ID_VENDOR
Message-ID: <20210119070737.786477-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:videolan:libbluray is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Avideolan%3Alibbluray

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbluray/libbluray.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index e2d7fc0c7d..36f59190b1 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -10,6 +10,7 @@ LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
 LIBBLURAY_INSTALL_STAGING = YES
 LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
+LIBBLURAY_CPE_ID_VENDOR = videolan
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
 LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
-- 
2.29.2
