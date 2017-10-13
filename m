From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Oct 2017 22:39:52 +0200
Subject: [Buildroot] [PATCH] wireguard: bump to version 0.0.20171011
Message-ID: <20171013203952.8670-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 1f55b7a6e7..8879f5fbbe 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2017-October/001791.html
-sha256 832a3b7cbb510f6986fd0c3a6b2d86bc75fc9f23b6754d8f46bc58ea8e02d608  WireGuard-0.0.20171005.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2017-October/001815.html
+sha256  e2e44ff658743507bca0f6b443c2f85aacc48d507ba2dcd4812717145df10b96 WireGuard-0.0.20171011.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 0ecb90022b..502a384c0f 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171005
+WIREGUARD_VERSION = 0.0.20171011
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
