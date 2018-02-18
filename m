From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Feb 2018 23:40:37 +0100
Subject: [Buildroot] [PATCH] wireguard: bump version to 0.0.20180218
Message-ID: <20180218224037.5450-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a memory leak and various minor tooling fixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 1bc6599620..4961d4fd14 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-February/002350.html
-sha256 ee3415b482265ad9e8721aa746aaffdf311058a2d1a4d80e7b6d11bbbf71c722  WireGuard-0.0.20180202.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-February/002406.html
+sha256 4ac4c4e4ad4dc2cf9dcb831b0cf347567ccea675ca524528cf5a4d9dccb2fe52  WireGuard-0.0.20180218.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 0b5a837a44..aa86b5782b 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180202
+WIREGUARD_VERSION = 0.0.20180218
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
