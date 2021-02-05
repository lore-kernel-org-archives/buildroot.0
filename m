From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Feb 2021 08:45:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptodev-linux: set
 CRYPTODEV_LINUX_CPE_ID_VENDOR
Message-ID: <20210205074509.1452181-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:cryptodev-linux:cryptodev-linux is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acryptodev-linux%3Acryptodev-linux

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptodev-linux/cryptodev-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 5b882b284e..2a65755aa2 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -9,6 +9,7 @@ CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,$(CRYPTODEV
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+
 CRYPTODEV_LINUX_LICENSE_FILES = COPYING
+CRYPTODEV_LINUX_CPE_ID_VENDOR = cryptodev-linux
 
 CRYPTODEV_LINUX_PROVIDES = cryptodev
 
-- 
2.29.2
