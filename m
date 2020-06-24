From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Jun 2020 07:55:24 +0200
Subject: [Buildroot] [PATCH] package/wireguard-tools: bump version to
 1.0.20200513
Message-ID: <20200624055525.13352-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index 475a7450a9..96134074f3 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-March/005191.html
-sha256  757ed31d4d48d5fd7853bfd9bfa6a3a1b53c24a94fe617439948784a2c0ed987  wireguard-tools-1.0.20200319.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-May/005431.html
+sha256  e73409a9fb8c90506db241d1e1a4e7372a60dbfa400e37f4ab2fd70a92ba495f  wireguard-tools-1.0.20200513.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index fc2ec876b3..c4890f9337 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20200319
+WIREGUARD_TOOLS_VERSION = 1.0.20200513
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
-- 
2.20.1
