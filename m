From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 23:48:53 +0200
Subject: [Buildroot] [PATCH 1/2] package/libuci: add LIBUCI_CPE_ID_VENDOR
Message-ID: <20210717214854.1150900-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpe:2.3:a:openwrt:libuci is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenwrt%3Alibuci

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuci/libuci.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index b7fd2ddb66..ae70b6f2af 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -9,6 +9,7 @@ LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
 LIBUCI_LICENSE_FILES = cli.c libuci.c
+LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
-- 
2.30.2
