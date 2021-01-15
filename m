From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 08:52:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcms2: add CPE variables
Message-ID: <20210115075249.2076903-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:littlecms:little_cms is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alittlecms%3Alittle_cms

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lcms2/lcms2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index d42c8c9a1f..34c2795e93 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -8,6 +8,8 @@ LCMS2_VERSION = 2.11
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
+LCMS2_CPE_ID_VENDOR = littlecms
+LCMS2_CPE_ID_NAME = little_cms
 LCMS2_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_JPEG),y)
-- 
2.29.2
