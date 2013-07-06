From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri,  5 Jul 2013 17:31:50 -0700
Subject: [Buildroot] [PATCH] ethtool: bump to version 3.10
Message-ID: <1373070710-20348-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ethtool/ethtool.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index bb2dc9f..66f8ffa 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 3.9
+ETHTOOL_VERSION = 3.10
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
 ETHTOOL_LICENSE_FILES = COPYING
-- 
1.7.10.4
