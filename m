From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Feb 2021 18:31:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/squashfs: set SQUASHFS_CPE_ID_VALID
Message-ID: <20210202173123.1517731-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:squashfs_project:squashfs is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asquashfs_project%3Asquashfs

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squashfs/squashfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index 15707e198e..026c0a46cc 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -8,6 +8,7 @@ SQUASHFS_VERSION = 4.4
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
+SQUASHFS_CPE_ID_VALID = YES
 SQUASHFS_MAKE_ARGS = XATTR_SUPPORT=1
 
 ifeq ($(BR2_PACKAGE_SQUASHFS_LZ4),y)
-- 
2.29.2
