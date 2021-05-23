From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 22:57:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/findutils: add
 FINDUTILS_CPE_ID_VENDOR
Message-ID: <20210523205738.1528964-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:findutils is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Afindutils

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/findutils/findutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 13d8271e18..a16f827166 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -9,6 +9,7 @@ FINDUTILS_SOURCE = findutils-$(FINDUTILS_VERSION).tar.xz
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
 FINDUTILS_LICENSE = GPL-3.0+
 FINDUTILS_LICENSE_FILES = COPYING
+FINDUTILS_CPE_ID_VENDOR = gnu
 FINDUTILS_CONF_ENV = \
 	gl_cv_func_stdin=yes \
 	ac_cv_func_working_mktime=yes \
-- 
2.30.2
