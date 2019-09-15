From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 09:18:21 +0200
Subject: [Buildroot] [git commit] package/wireguard: bump version to
 0.0.20190905
Message-ID: <20190915071604.6CB198E1D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32e7096ff0ead48a316d17c6c1b974efa8e5d591
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-September/004483.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 42a035d564..a05bf06be4 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-July/004271.html
-sha256 1a1311bc71abd47a72c47d918be3bacc486b3de90734661858af75cc990dbaac  WireGuard-0.0.20190702.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-September/004483.html
+sha256 78767ceeb5286beaa851145f072d920a340a9f1b771a2943b8efd638cee1a8f6  WireGuard-0.0.20190905.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 9d10fe5830..29a360d61b 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20190702
+WIREGUARD_VERSION = 0.0.20190905
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
