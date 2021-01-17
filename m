From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 15:03:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/subversion: add
 SUBVERSION_CPE_ID_VENDOR
Message-ID: <20210117140354.345049-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:apache:subversion is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aapache%3Asubversion

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/subversion/subversion.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 83a359b966..34ae7bc5e1 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -9,6 +9,7 @@ SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = https://downloads.apache.org/subversion
 SUBVERSION_LICENSE = Apache-2.0
 SUBVERSION_LICENSE_FILES = LICENSE
+SUBVERSION_CPE_ID_VENDOR = apache
 SUBVERSION_DEPENDENCIES = \
 	host-pkgconf \
 	apr \
-- 
2.29.2
