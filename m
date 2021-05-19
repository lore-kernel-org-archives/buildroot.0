From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libusb: add
 LIBUSB_CPE_ID_VENDOR
Message-ID: <20210519192210.2DD1F88773@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77a577975826bd590f605ba78d3932c33be59a04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libusb:libusb is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibusb%3Alibusb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f7b286594930963e439f12572174ea4082a23fa7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
