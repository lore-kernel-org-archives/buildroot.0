From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Apr 2018 18:21:36 +0200
Subject: [Buildroot] [git commit] wireguard: bump to version 0.0.20180420
Message-ID: <20180427162220.9740588E78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=062dcceed0ba0d2b1929597ad9b0393dbdb21628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 969b9e1962..6cfc7bb9f0 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-March/002446.html
-sha256 efb1652f0da67fb2731040439b6abb820a5e2f1bc177aa15c5dce68ea3327787  WireGuard-0.0.20180304.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-April/002697.html
+sha256 b58cd2acf9e8d3fe9044c06c0056bd74da1f5673a456f011d36eee3f6fb1da16  WireGuard-0.0.20180420.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 7c5e6a3e09..20162e1d0f 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180304
+WIREGUARD_VERSION = 0.0.20180420
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
