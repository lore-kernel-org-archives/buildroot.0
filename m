From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 15:14:43 +0100
Subject: [Buildroot] [git commit master] mtd: tweak default values
Message-ID: <20100203151850.8B9E077761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d6e6a2e2e26c67b1aec1a1fcc17f76d410d8aa74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't enable uncommon tools by default.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 01fe611..c77cff8 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -44,21 +44,17 @@ config BR2_PACKAGE_MTD_FLASH_UNLOCK
 
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
-	default y
 
 config BR2_PACKAGE_MTD_FTL_FORMAT
 	bool "ftl_format"
-	default y
 
 config BR2_PACKAGE_MTD_JFFS2DUMP
 	bool "jffs2dump"
-	default y
 
 config BR2_PACKAGE_MTD_MKFSJFFS2
 	bool "mkfs.jffs2"
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LZO
-	default y
 
 config BR2_PACKAGE_MTD_MTD_DEBUG
 	bool "mtd_debug"
@@ -96,7 +92,6 @@ config BR2_PACKAGE_MTD_SERVE_IMAGE
 
 config BR2_PACKAGE_MTD_SUMTOOL
 	bool "sumtool"
-	default y
 
 config BR2_PACKAGE_MTD_UBIATTACH
 	bool "ubiattach"
-- 
1.6.3.3
