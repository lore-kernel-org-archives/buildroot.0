From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:41:43 +0200
Subject: [Buildroot] [git commit] package/wireguard: bump version to
 0.0.20191012
Message-ID: <20191016193544.2348F7FF3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e0049146be587706f642c637ee6063a08e19d9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-October/004594.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index f9685baf5a..9ad434f54d 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-September/004539.html
-sha256 997327185d2d1b597dc118f737c0c165e2a2c21453387ea02659f1159d148518  WireGuard-0.0.20190913.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-October/004594.html
+sha256 93573193c9c1c22fde31eb1729ad428ca39da77a603a3d81561a9816ccecfa8e  WireGuard-0.0.20191012.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index e59efd137f..a494160423 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20190913
+WIREGUARD_VERSION = 0.0.20191012
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
