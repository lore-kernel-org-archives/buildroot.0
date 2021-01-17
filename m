From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:36:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/logrotate: set
 LOGROTATE_CPE_ID_VALID
Message-ID: <20210117163624.353773-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:logrotate_project:logrotate is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alogrotate_project%3Alogrotate

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/logrotate/logrotate.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index fe674ee6a5..747d8c2930 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -8,6 +8,7 @@ LOGROTATE_VERSION = 3.17.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
+LOGROTATE_CPE_ID_VALID = YES
 LOGROTATE_DEPENDENCIES = popt host-pkgconf
 # tarball does not have a generated configure script
 LOGROTATE_AUTORECONF = YES
-- 
2.29.2
