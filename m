From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 23:36:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: add LVM2_CPE_ID_VENDOR
Message-ID: <20210515213606.3668135-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:redhat:lvm2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aredhat%3Alvm2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lvm2/lvm2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index dc4e938697..1194044537 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -10,6 +10,7 @@ LVM2_SITE = http://sources.redhat.com/pub/lvm2
 LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
+LVM2_CPE_ID_PRODUCT = redhat
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner. We disable NLS because it's broken, and
-- 
2.30.2
