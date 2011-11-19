From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 19 Nov 2011 21:51:58 +0100
Subject: [Buildroot] [git commit branch/next] mtd-utils: bump version
Message-ID: <20111119205507.D5FCD805F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39ea7bcec02c31dcb91f0e606e0c598a24afb4b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Identical to 1.4.7, except that the version number in the Makefile is
correct.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index ea72ba8..6b01440 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION = 1.4.7
+MTD_VERSION = 1.4.8
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
