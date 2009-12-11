From: Daniel Mack <daniel@caiaq.de>
Date: Sat, 12 Dec 2009 07:45:09 +0800
Subject: [Buildroot] [PATCH] mtd-utils: bump version number
Message-ID: <1260575109-7459-1-git-send-email-daniel@caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream git commit used by mtd.mk is not valid anymore, for unclear
reasons. Use the current HEAD as new anchor.

Also, the name inside the generated tarball now contains a shortened
version of the commit ID. Follow that change as well.

Signed-off-by: Daniel Mack <daniel@caiaq.de>
---
 package/mtd/mtd-utils.git/mtd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index 3c17c21..c4a2b28 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -3,13 +3,13 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=e783e75e09b4a0a519665afd7bdeaf2985e7a09c
+MTD_VERSION:=a4e502d99129da8ebba6d40b373a4422a175e9af
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOL_BUILD_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_CAT:=$(ZCAT)
-MTD_NAME:=mtd-utils
+MTD_NAME:=mtd-utils-a4e502d
 
 #############################################################
 #
-- 
1.6.3.3
