From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 May 2021 19:28:06 +0200
Subject: [Buildroot] [git commit] package/libmodbus: add
 LIBMODBUS_CPE_ID_VENDOR
Message-ID: <20210516171206.E861F81FCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8910dc505a77952fafeee326ca04da5345cdea96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:libmodbus:libmodbus is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibmodbus%3Alibmodbus

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libmodbus/libmodbus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
index 584ac75055..52eb318a99 100644
--- a/package/libmodbus/libmodbus.mk
+++ b/package/libmodbus/libmodbus.mk
@@ -8,6 +8,7 @@ LIBMODBUS_VERSION = 3.1.6
 LIBMODBUS_SITE = http://libmodbus.org/releases
 LIBMODBUS_LICENSE = LGPL-2.1+
 LIBMODBUS_LICENSE_FILES = COPYING.LESSER
+LIBMODBUS_CPE_ID_VENDOR = libmodbus
 LIBMODBUS_INSTALL_STAGING = YES
 LIBMODBUS_CONF_OPTS = --without-documentation --disable-tests
 
