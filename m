From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 17:21:13 +0100
Subject: [Buildroot] [git commit] package/tinc: add TINC_CPE_ID_VENDOR
Message-ID: <20210117160239.09CE888280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c3f0914f7b28c40ca1742654f83cb8a3d32b785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:tinc-vpn:tinc is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atinc-vpn%3Atinc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tinc/tinc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index 56a26e9a55..0726e81d52 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -9,6 +9,7 @@ TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
 TINC_LICENSE_FILES = COPYING COPYING.README
+TINC_CPE_ID_VENDOR = tinc-vpn
 TINC_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
