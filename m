From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 19:09:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libusb: add LIBUSB_CPE_ID_VENDOR
Message-ID: <20210516170940.4232-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libusb:libusb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibusb%3Alibusb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libusb/libusb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 26e91e3da6..28efcadefc 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -10,6 +10,7 @@ LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
 LIBUSB_LICENSE_FILES = COPYING
+LIBUSB_CPE_ID_VENDOR = libusb
 LIBUSB_DEPENDENCIES = host-pkgconf
 LIBUSB_INSTALL_STAGING = YES
 
-- 
2.30.2
