From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 14:00:16 +0200
Subject: [Buildroot] [git commit] ethtool: bump to version 4.16
Message-ID: <20180602101013.E913A8199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=986fcc6cc7a153f82e95d0db418341ba318ca263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 9704a54b0d..bac7401d3c 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	71f7fd32483ffdc7c6c4d882e230714eb101df0a46cbe396dbeb8ac78f1ef91a	ethtool-4.15.tar.xz
+sha256	fe967a6722db2099fa63d847b6628e3e31cf9f53571a37503347dcc3e4015a03	ethtool-4.16.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
 sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1	LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index be587f5083..b974b5f76e 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.15
+ETHTOOL_VERSION = 4.16
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
