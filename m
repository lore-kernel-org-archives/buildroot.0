From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 13 Jan 2020 15:23:58 +0100
Subject: [Buildroot] [PATCH] package/ethtool: bump to version 5.4
Message-ID: <1578925438-4442-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See full changelog https://www.spinics.net/lists/netdev/msg624080.html

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index f8ac6c6..86c71d7 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	f3dac0dbce7066af05fbe92812cc33a042d03fb00a45bcf9959f20455efe24c4	ethtool-5.3.tar.xz
+sha256	22f81e4927d6eb6a13a259d705248a96005fce2005e15257f639f5a1c8c52b6b	ethtool-5.4.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
 sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1	LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index c5f15fc..ce4f2d8 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.3
+ETHTOOL_VERSION = 5.4
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.7.4
