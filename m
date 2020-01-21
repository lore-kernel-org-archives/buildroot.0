From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 17:35:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireguard-tools: bump to version
 1.0-20200121
Message-ID: <20200121163519.10171-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-January/004869.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index b8b1dac1ac..1650f67e7a 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004819.html
-sha256 547cd1c2f8dca904faac9e8d3964f1ef956c24bb12e3498da88dde95243c7f08  wireguard-tools-1.0.20200102.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004869.html
+sha256 15bfdbdbecbd3870ced9a7e68286c871bfcb2071d165f113808081f2e428faa3  wireguard-tools-1.0.20200121.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index 6fcfebf13a..0acf0fcbb5 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20200102
+WIREGUARD_TOOLS_VERSION = 1.0.20200121
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
-- 
2.20.1
