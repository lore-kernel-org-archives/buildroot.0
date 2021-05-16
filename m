From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:06:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmms: add LIBMMS_CPE_ID_VENDOR
Message-ID: <20210516170655.3786-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libmms_project:libmms is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibmms_project%3Alibmms

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmms/libmms.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
index 236fe1376e..a4c40ad60a 100644
--- a/package/libmms/libmms.mk
+++ b/package/libmms/libmms.mk
@@ -10,5 +10,6 @@ LIBMMS_INSTALL_STAGING = YES
 LIBMMS_DEPENDENCIES = host-pkgconf libglib2
 LIBMMS_LICENSE = LGPL-2.1+
 LIBMMS_LICENSE_FILES = COPYING.LIB
+LIBMMS_CPE_ID_VENDOR = libmms_project
 
 $(eval $(autotools-package))
-- 
2.30.2
