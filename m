From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Sep 2011 17:14:17 +0200
Subject: [Buildroot] [git commit] ethtool: bump to 3.0
Message-ID: <20110910214434.D08CA8D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0789fd3825c00138b832dd97cf9d95242efca75e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index d3f578c..af066dd 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 2.6.39
+ETHTOOL_VERSION = 3.0
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
 
 $(eval $(call AUTOTARGETS,package,ethtool))
-- 
1.7.3.4
