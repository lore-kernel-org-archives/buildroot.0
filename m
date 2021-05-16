From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 18:30:44 +0200
Subject: [Buildroot] [git commit] package/taglib: add TAGLIB_CPE_ID_VENDOR
Message-ID: <20210516161235.B78BE87939@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eecf0e55d379083b9dd19256b8a3a2f8898c1b12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:taglib:taglib is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ataglib%3Ataglib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
