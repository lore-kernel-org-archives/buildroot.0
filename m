From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 4 Apr 2011 22:21:47 +0200
Subject: [Buildroot] [git commit] mtd: bump version
Message-ID: <20110404202244.EB50B8190F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bb008d43fca26b76f98fa3e5c03293603886524
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump mtd-utils version to 1.4.4 which contains the
flash_eraseall -j bug-fix.

http://lists.infradead.org/pipermail/linux-mtd/2011-March/034505.html

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6b8f2c7..a957441 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.4.3
+MTD_VERSION:=1.4.4
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
-- 
1.7.3.4
