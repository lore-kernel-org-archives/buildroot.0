From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 12:37:01 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/wireguard-linux-compat: bump version to 1.0.20200413
Message-ID: <20200508143236.5D21C91051@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9097b9ef06b030e9b8be5f31acbe219b04dae6a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-April/005295.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 66962e9bb86ea63b985c261b653ddfcf1345eef7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index a9675b5180..d308f47a13 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-April/005237.html
-sha256  7dfb4a8315e1d6ae406ff32d01c496175df558dd65968a19e5222d02c7cfb77a  wireguard-linux-compat-1.0.20200401.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-April/005296.html
+sha256  cf166348fbb67419528e73049ce001d29131aea367fa6aef9d3e223f7251e116  wireguard-linux-compat-1.0.20200413.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index d5a2341d77..27f5981ae3 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200401
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200413
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
