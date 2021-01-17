From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 17:06:34 +0100
Subject: [Buildroot] [PATCH 1/1] boot/shim: add SHIM_CPE_ID_VENDOR
Message-ID: <20210117160634.351214-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:redhat:shim is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredhat%3Ashim

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 boot/shim/shim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
index ba5bc51957..e0f01a8a9d 100644
--- a/boot/shim/shim.mk
+++ b/boot/shim/shim.mk
@@ -8,6 +8,7 @@ SHIM_VERSION = 15
 SHIM_SITE = $(call github,rhboot,shim,$(SHIM_VERSION))
 SHIM_LICENSE = BSD-2-Clause
 SHIM_LICENSE_FILES = COPYRIGHT
+SHIM_CPE_ID_VENDOR = redhat
 SHIM_DEPENDENCIES = gnu-efi
 SHIM_INSTALL_TARGET = NO
 SHIM_INSTALL_IMAGES = YES
-- 
2.29.2
