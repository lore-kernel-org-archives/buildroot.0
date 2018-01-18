From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Jan 2018 19:11:30 +0100
Subject: [Buildroot] [PATCH] wireguard: bump version to 0.0.20180118
Message-ID: <20180118181130.14336-1-peter@korsgaard.com>
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
index 0044562a1d..a99bba540e 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2017-December/002231.html
-sha256 2b97697e9b271ba8836a04120a287b824648124f21d5309170ec51c1f86ac5ed  WireGuard-0.0.20171221.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-January/002305.html
+sha256 463f3b402deb66b7ceac8df2d50944f32683933356455d6c1c7453926db3a8a3  WireGuard-0.0.20180118.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 96fd080c22..5a4f083c6e 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171221
+WIREGUARD_VERSION = 0.0.20180118
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
