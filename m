From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 16:05:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/feh: add FEH_CPE_ID_VENDOR
Message-ID: <20210717140513.996425-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpe:2.3:a:feh_project:feh is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afeh_project%3Afeh

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/feh/feh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index df59e67d52..f27509330d 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -10,6 +10,7 @@ FEH_SITE = http://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
 FEH_LICENSE = MIT
 FEH_LICENSE_FILES = COPYING
+FEH_CPE_ID_VENDOR = feh_project
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 FEH_DEPENDENCIES += libcurl
-- 
2.30.2
