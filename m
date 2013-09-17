From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Sep 2013 13:31:36 -0300
Subject: [Buildroot] [PATCH 1/3] ethtool: bump to version 3.11
Message-ID: <1379435498-1598-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ethtool/ethtool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index cdc9a6d..7c22269 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 3.10
+ETHTOOL_VERSION = 3.11
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
-- 
1.8.1.5
