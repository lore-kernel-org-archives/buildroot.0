From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Apr 2019 08:46:11 +0200
Subject: [Buildroot] [PATCH] package/wireguard: bump version to 0.0.20190406
Message-ID: <20190408064611.7266-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-April/004062.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 5f092a3f8c..d23fe500a2 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-February/003923.html
-sha256 fcdb26fd2692d9e1dee54d14418603c38fbb973a06ce89d08fbe45292ff37f79  WireGuard-0.0.20190227.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-April/004062.html
+sha256 2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b  WireGuard-0.0.20190406.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 246b104d6f..8686bed4f9 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20190227
+WIREGUARD_VERSION = 0.0.20190406
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
