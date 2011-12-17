From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Dec 2011 16:04:09 +0100
Subject: [Buildroot] [git commit] mtd-utils: bump version
Message-ID: <20111217163908.3F3718FA81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b008550f7fbaae2eae926b5906ce70d075190756
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes an issue with erases on NOR flash with linux 3.2+.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6b01440..42fa7aa 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION = 1.4.8
+MTD_VERSION = 1.4.9
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
