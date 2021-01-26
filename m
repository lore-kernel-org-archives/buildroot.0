From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 26 Jan 2021 21:44:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/xapian: add CPE variables
Message-ID: <20210126204403.2496291-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:xapian:xapian-core is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axapian%3Axapian-core

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xapian/xapian.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 3ad816a36f..1a8557d603 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -9,6 +9,8 @@ XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
 XAPIAN_LICENSE_FILES = COPYING
+XAPIAN_CPE_ID_VENDOR = xapian
+XAPIAN_CPE_ID_PRODUCT = xapian-core
 XAPIAN_INSTALL_STAGING = YES
 XAPIAN_DEPENDENCIES = zlib
 
-- 
2.29.2
