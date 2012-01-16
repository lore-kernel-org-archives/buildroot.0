From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 16 Jan 2012 16:04:35 +0100
Subject: [Buildroot] [PATCH 1/2] ethtool: bump to 3.2
Message-ID: <1326726276-8442-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/ethtool/ethtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 04f7dac..101d0a1 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION = 3.1
+ETHTOOL_VERSION = 3.2
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.1.1
