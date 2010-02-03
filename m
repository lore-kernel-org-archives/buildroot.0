From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 3 Feb 2010 15:14:43 +0100
Subject: [Buildroot] [git commit master] mtd: don't put mtd options in a
	seperate submenu
Message-ID: <20100203151851.7CA4677761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=653f7adb10ef53bffb9add3ab6c80c707b75da8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to other packages.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index c77cff8..8e846a3 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -1,4 +1,4 @@
-menuconfig BR2_PACKAGE_MTD
+config BR2_PACKAGE_MTD
 	bool "mtd/jffs2 utilities"
 	help
 	  Build mtd/jffs utilities
-- 
1.6.3.3
