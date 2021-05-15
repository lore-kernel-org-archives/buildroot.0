From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 00:05:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/taglib: add TAGLIB_CPE_ID_VENDOR
Message-ID: <20210515220510.3670122-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:taglib:taglib is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ataglib%3Ataglib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/taglib/taglib.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 738be35756..f31f1046a5 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -9,6 +9,7 @@ TAGLIB_SITE = http://taglib.github.io/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
+TAGLIB_CPE_ID_VENDOR = taglib
 
 # 0002-Don-t-assume-TDRC-is-an-instance-of-TextIdentificationFrame.patch
 TAGLIB_IGNORE_CVES += CVE-2017-12678
-- 
2.30.2
