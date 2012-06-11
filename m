From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 10:59:36 +0200
Subject: [Buildroot] [git commit] ethtool: bump version
Message-ID: <20120611085952.C332996E8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f10913cf8e0790517a552a0a959f501e46b88cae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 101d0a1..b6cbc64 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.2
+ETHTOOL_VERSION = 3.4
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 
 $(eval $(call AUTOTARGETS))
