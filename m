From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 09 Jun 2011 14:19:41 +0200
Subject: [Buildroot] [PATCH]ethtool: bump to 2.6.39
Message-ID: <4DF0BA5D.3000106@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

---
 package/ethtool/ethtool.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/package/ethtool/ethtool.mk
===================================================================
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 2.6.38
+ETHTOOL_VERSION = 2.6.39
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool/
 
 $(eval $(call AUTOTARGETS,package,ethtool))
