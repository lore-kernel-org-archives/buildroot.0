From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Mar 2011 12:10:08 +0100
Subject: [Buildroot] [git commit master 1/1] ethtool: bump version,
	use new upstream location
Message-ID: <20110317111324.D8C1F90A37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=851c9b56e81eee992293c98a1843e7bcda3e3a9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 1fc2315..53bbb67 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 2.6.35
-ETHTOOL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
+ETHTOOL_VERSION = 2.6.38
+ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
 
 $(eval $(call AUTOTARGETS,package,ethtool))
-- 
1.7.3.4
