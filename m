From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Nov 2017 21:23:52 +0100
Subject: [Buildroot] [git commit] wireguard: bump to version 0.0.20171101
Message-ID: <20171101202433.2A49581037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1a06aeeb99a5b388b75c35fd03ec2374aff0376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 8879f5f..050d466 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2017-October/001815.html
-sha256  e2e44ff658743507bca0f6b443c2f85aacc48d507ba2dcd4812717145df10b96 WireGuard-0.0.20171011.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2017-November/001881.html
+sha256 096b6482a65e566c7bf8c059f5ee6aadb2de565b04b6d810c685f1c377540325  WireGuard-0.0.20171101.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 502a384..63d5366 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171011
+WIREGUARD_VERSION = 0.0.20171101
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
