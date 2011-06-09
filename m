From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Jun 2011 17:42:22 +0200
Subject: [Buildroot] [git commit] ethtool: bump to 2.6.39
Message-ID: <20110609154413.B753785A99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e446aa072a9504906dc01070847a9048410e218f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 53bbb67..d3f578c 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 2.6.38
+ETHTOOL_VERSION = 2.6.39
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
 
 $(eval $(call AUTOTARGETS,package,ethtool))
-- 
1.7.3.4
