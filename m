From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 13:11:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/libplist: add LIBPLIST_CPE_ID_VENDOR
Message-ID: <20210117121118.315992-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libimobiledevice:libplist is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibimobiledevice%3Alibplist

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libplist/libplist.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 10a6bcd5bc..0818a29f66 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -9,6 +9,7 @@ LIBPLIST_SITE = $(call github,libimobiledevice,libplist,$(LIBPLIST_VERSION))
 LIBPLIST_INSTALL_STAGING = YES
 LIBPLIST_LICENSE = LGPL-2.1+
 LIBPLIST_LICENSE_FILES = COPYING
+LIBPLIST_CPE_ID_VENDOR = libimobiledevice
 # github tarball does not include configure
 LIBPLIST_AUTORECONF = YES
 
-- 
2.29.2
