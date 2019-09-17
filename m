From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 21:40:28 +0200
Subject: [Buildroot] [git commit] package/wireguard: bump version to
 0.0.20190913
Message-ID: <20190917193557.7EA6A8E8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9b9ac6e0a6218f5ab060c44744557d9abf5addb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-September/004539.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index a05bf06be4..f9685baf5a 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-September/004483.html
-sha256 78767ceeb5286beaa851145f072d920a340a9f1b771a2943b8efd638cee1a8f6  WireGuard-0.0.20190905.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-September/004539.html
+sha256 997327185d2d1b597dc118f737c0c165e2a2c21453387ea02659f1159d148518  WireGuard-0.0.20190913.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 29a360d61b..e59efd137f 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20190905
+WIREGUARD_VERSION = 0.0.20190913
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
