From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  4 Sep 2017 22:21:00 +0300
Subject: [Buildroot] [PATCH] ethtool: bump to version 4.11
Message-ID: <92cc11e8f80f457f082c131bd7d7e8b762ae6b03.1504552860.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ethtool/ethtool.hash | 4 +++-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 4071fb062159..77fb6009b67b 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	f0009726ecf34128b9a8238b71a652847dbc06bd1b877656699b0592b95c74ba	ethtool-4.10.tar.xz
+sha256	12d8edaa8064966b8ef19cc44fecc096a68828035b6a1f2c67a27531a718e1b2	ethtool-4.11.tar.xz
+# Locally calculated
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index ac67eeadded8..225eedd09c5f 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.10
+ETHTOOL_VERSION = 4.11
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.14.1
