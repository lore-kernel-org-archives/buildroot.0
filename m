From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:46:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/cpio: add CPIO_CPE_ID_VENDOR
Message-ID: <20210117164649.354578-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:cpio is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Acpio

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index 1d9c54669e..9ce281dd1c 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -10,6 +10,7 @@ CPIO_SITE = $(BR2_GNU_MIRROR)/cpio
 CPIO_CONF_OPTS = --bindir=/bin
 CPIO_LICENSE = GPL-3.0+
 CPIO_LICENSE_FILES = COPYING
+CPIO_CPE_ID_VENDOR = gnu
 
 # cpio uses argp.h which is not provided by uclibc or musl by default.
 # Use the argp-standalone package to provide this.
-- 
2.29.2
