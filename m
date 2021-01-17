From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 16:28:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/quagga: add QUAGGA_CPE_ID_VENDOR
Message-ID: <20210117152854.348211-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:quagga:quagga is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aquagga%3Aquagga

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quagga/quagga.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 0b352aa367..adf8085054 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -10,6 +10,7 @@ QUAGGA_INSTALL_STAGING = YES
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
 QUAGGA_LICENSE_FILES = COPYING
+QUAGGA_CPE_ID_VENDOR = quagga
 
 # We need to override the sysconf and localstate directories so that
 # quagga can create files as the quagga user without extra
-- 
2.29.2
