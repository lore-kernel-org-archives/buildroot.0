From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 26 Jun 2016 16:36:44 -0300
Subject: [Buildroot] [PATCH] ethtool: bump to version 4.6
Message-ID: <1466969804-14201-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 04022a5..73a25ed 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	bb2834332c5ac7f5bbe1c9f78f4fa851e4a3fe6397b124d58467c9ccee9fca3b	ethtool-4.5.tar.xz
+sha256	e90589a9349d008cce8c0510ac4e8878efdc0ddb1b732a9a4cc333b101313415	ethtool-4.6.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index f6f4263..fb751a4 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.5
+ETHTOOL_VERSION = 4.6
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
-- 
2.7.3
