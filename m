From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  1 Jan 2019 22:49:42 +0100
Subject: [Buildroot] [PATCH] package/wireguard: bump version to 0.0.20181218
Message-ID: <20190101214942.3220-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2018-December/003687.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index f757a86630..265ae671ef 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-November/003572.html
-sha256 7d47f7996dd291069de4efb3097c42f769f60dc3ac6f850a4d5705f321e4406b  WireGuard-0.0.20181119.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2018-December/003687.html
+sha256 2e9f86acefa49dbfb7fa6f5e10d543f1885a2d5460cd5e102696901107675735  WireGuard-0.0.20181218.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 93373d8538..d36929efd8 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20181119
+WIREGUARD_VERSION = 0.0.20181218
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
