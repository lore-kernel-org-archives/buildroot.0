From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Sep 2011 13:57:14 +0200
Subject: [Buildroot] [git commit] libsvgtiny: bump version for stroke-width
	fix
Message-ID: <20110912121423.026F08D588@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b4df72a91453e768c998e4d671b597c45a9812b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsvgtiny/libsvgtiny.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index d9ac41b..1a7ce37 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -5,7 +5,7 @@
 ############################################################
 
 LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
-LIBSVGTINY_VERSION = 9800
+LIBSVGTINY_VERSION = 12121
 
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_INSTALL_TARGET = YES
-- 
1.7.3.4
