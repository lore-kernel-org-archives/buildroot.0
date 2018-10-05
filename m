From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 20:33:52 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] wireguard: bump version
 to 0.0.20180925
Message-ID: <20181005183258.30B898D494@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4556bd42c3ebae956256af508c2dd327bfeaca30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0a656bc0658e79f7ddc4c9734ad9c52a5df46296)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index d0cd65ad4f..fe6439fbc2 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-July/003112.html
-sha256 5e38d554f7d1e3a64e3a5319ca1a3b790c84ed89c896586c490a93ac1f953a91  WireGuard-0.0.20180708.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-September/003395.html
+sha256 4a0488a07e40ec17e798f3e40a85cedf55f0560b1c3a8fd95806c7d4266cb0e8  WireGuard-0.0.20180925.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index cc8ad7c4cc..faddbf93ad 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180708
+WIREGUARD_VERSION = 0.0.20180925
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
