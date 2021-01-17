From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:27:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/atop: set ATOP_CPE_ID_VALID
Message-ID: <20210117162711.353101-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:atop_project:atop is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aatop_project%3Aatop

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atop/atop.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index e387532b98..acbaf2995a 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -8,6 +8,7 @@ ATOP_VERSION = 2.6.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
+ATOP_CPE_ID_VALID = YES
 ATOP_DEPENDENCIES = ncurses zlib
 
 ATOP_CFLAGS = $(TARGET_CFLAGS)
-- 
2.29.2
