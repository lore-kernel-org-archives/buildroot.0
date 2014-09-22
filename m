From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Sep 2014 13:54:12 -0300
Subject: [Buildroot] [PATCH] ethtool: bump to version 3.16
Message-ID: <1411404852-11961-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ethtool/ethtool.hash | 2 ++
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/ethtool/ethtool.hash

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
new file mode 100644
index 0000000..cd53325
--- /dev/null
+++ b/package/ethtool/ethtool.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
+sha256	d6e0dd3fa904c3ad87487c66a4a8fde1ebc4194979ca5755df4b2efb247ca286	ethtool-3.16.tar.xz
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 3d8d3cd..45c4735 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 3.15
+ETHTOOL_VERSION = 3.16
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPLv2
-- 
1.8.5.5
