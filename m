From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 12:20:14 +0100
Subject: [Buildroot] [PATCH] wireguard: bump version
Message-ID: <20171211112014.15274-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Various bugfixes, including a compat fix for <= 3.10.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 3749456cb0..3e90603691 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2017-November/001935.html
-sha256 d9347786a9406ac276d86321ca64aadb1f0639cb0582c6e0519c634cf6e81157  WireGuard-0.0.20171111.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2017-December/002200.html
+sha256 57d799d35e92c905e548d00adeb7ed1ead4d6560f084c99e5aae0a87b4eb09e4  WireGuard-0.0.20171211.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 2eacb22a4b..5f19cc7bbf 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171111
+WIREGUARD_VERSION = 0.0.20171211
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
-- 
2.11.0
