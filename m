From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:12:52 -0400
Subject: [Buildroot] [PATCH 13/17] mtd: add license info
Message-ID: <1344715972-9800-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/mtd/mtd.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 9b60ac8..7e3a9b8 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -6,6 +6,9 @@
 MTD_VERSION = 1.5.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
+MTD_LICENSE = GPLv2
+MTD_LICENSE_FILES = COPYING
+
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 MTD_DEPENDENCIES = zlib lzo
 endif
-- 
1.7.9.5
