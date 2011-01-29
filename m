From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 00:40:13 +0100
Subject: [Buildroot] [git commit master 1/1] mtd: bump version
Message-ID: <20110129234038.13C818E076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=50c93ed9b3d906b0e10c370431ca9e333053bdef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index ec8c663..8a819fa 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.4.1
+MTD_VERSION:=1.4.2
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
-- 
1.7.3.4
