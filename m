From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 07:21:45 +0100
Subject: [Buildroot] [PATCH] wireguard: bump version to 0.0.20180304
Message-ID: <20180313062146.5481-1-peter@korsgaard.com>
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
index 4961d4fd14..969b9e1962 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-February/002406.html
-sha256 4ac4c4e4ad4dc2cf9dcb831b0cf347567ccea675ca524528cf5a4d9dccb2fe52  WireGuard-0.0.20180218.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-March/002446.html
+sha256 efb1652f0da67fb2731040439b6abb820a5e2f1bc177aa15c5dce68ea3327787  WireGuard-0.0.20180304.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index aa86b5782b..7c5e6a3e09 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180218
+WIREGUARD_VERSION = 0.0.20180304
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
