From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  6 Oct 2017 13:15:25 +0200
Subject: [Buildroot] [PATCH] wireguard: bump version
Message-ID: <20171006111525.2148-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 3 ++-
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 6ee22a7a1d..1f55b7a6e7 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,3 +1,4 @@
+# From https://lists.zx2c4.com/pipermail/wireguard/2017-October/001791.html
+sha256 832a3b7cbb510f6986fd0c3a6b2d86bc75fc9f23b6754d8f46bc58ea8e02d608  WireGuard-0.0.20171005.tar.xz
 # Locally calculated
-sha256 ecff9a184685b7dd2d81576eba5bd96bb59031c9e9b5eeee05d6dc298f30998e  WireGuard-0.0.20171001.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index e946e4ca39..0ecb90022b 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171001
+WIREGUARD_VERSION = 0.0.20171005
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
