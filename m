From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Mar 2011 13:26:48 +0100
Subject: [Buildroot] [git commit master 1/1] mtd: bump version
Message-ID: <20110318122732.21A14909C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=91c4ff298cf91cd6782f5ba5c3f9e51d902d1b7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes flash_erase argument handling (start should be in bytes, not blocks).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 8a819fa..6b8f2c7 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.4.2
+MTD_VERSION:=1.4.3
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
-- 
1.7.3.4
