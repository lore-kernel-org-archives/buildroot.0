From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 15:50:04 +0200
Subject: [Buildroot] [PATCH-NEXT] package/wireguard: bump version to
 0.0.20190702
Message-ID: <20190830135004.2284-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-July/004271.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 9546ebd0f2..42a035d564 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-June/004196.html
-sha256 7528461824a0174bd7d4f15e68d8f0ce9a8ea318411502b80759438e8ef65568  WireGuard-0.0.20190601.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-July/004271.html
+sha256 1a1311bc71abd47a72c47d918be3bacc486b3de90734661858af75cc990dbaac  WireGuard-0.0.20190702.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index c52e942c18..9d10fe5830 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20190601
+WIREGUARD_VERSION = 0.0.20190702
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
