From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 12 Nov 2018 20:48:23 +0200
Subject: [Buildroot] [PATCH next] ethtool: bump to version 4.19
Message-ID: <f4fa76ede68c47037c745cd1e56f95a97073a3b6.1542048503.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index bac7401d3c32..b918dca3080e 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256	fe967a6722db2099fa63d847b6628e3e31cf9f53571a37503347dcc3e4015a03	ethtool-4.16.tar.xz
+sha256	b18a6c364e42c29cdac057cf183c9674163db96b30848adfa8c2a90450f6d0c8	ethtool-4.19.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
 sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1	LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index b974b5f76e23..ae15800b195f 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 4.16
+ETHTOOL_VERSION = 4.19
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.19.1
