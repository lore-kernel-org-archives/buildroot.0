From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 14:50:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/vdr: add VDR_CPE_ID_VENDOR
Message-ID: <20210130135038.2368863-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:tvdr:vdr is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atvdr%3Avdr

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vdr/vdr.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index fc456c2a30..eac13bfff4 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -9,6 +9,7 @@ VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr
 VDR_LICENSE = GPL-2.0+
 VDR_LICENSE_FILES = COPYING
+VDR_CPE_ID_VENDOR = tvdr
 VDR_INSTALL_STAGING = YES
 VDR_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.29.2
