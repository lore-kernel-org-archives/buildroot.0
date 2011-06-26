From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Jun 2011 09:12:52 +0200
Subject: [Buildroot] [git commit] mtd: bump version
Message-ID: <20110626071724.C46D888E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7fcfbfa9d1e571672877da8d85f838329713825
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index a957441..78ab765 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.4.4
+MTD_VERSION:=1.4.5
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
-- 
1.7.3.4
