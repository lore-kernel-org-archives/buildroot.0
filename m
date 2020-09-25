From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2020 11:34:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/wireguard-tools: bump to
 1.0.20200827 release
Message-ID: <20200925093429.11094-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-August/005790.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index 96134074f3..3bff364e06 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-May/005431.html
-sha256  e73409a9fb8c90506db241d1e1a4e7372a60dbfa400e37f4ab2fd70a92ba495f  wireguard-tools-1.0.20200513.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-August/005790.html
+sha256  51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd  wireguard-tools-1.0.20200827.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index c4890f9337..d360c81208 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20200513
+WIREGUARD_TOOLS_VERSION = 1.0.20200827
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
-- 
2.20.1
