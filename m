From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Dec 2019 10:13:40 +0100
Subject: [Buildroot] [git commit] package/wireguard: bump version to
 0.0.20191212
Message-ID: <20191218090635.D24E58B916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37cab1a4209a8308702c2d8c15d19db511b6bb9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-December/004764.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 9ad434f54d..66ebf41dc6 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-October/004594.html
-sha256 93573193c9c1c22fde31eb1729ad428ca39da77a603a3d81561a9816ccecfa8e  WireGuard-0.0.20191012.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-December/004764.html
+sha256 b0d718380f7a8822b2f12d75e462fa4eafa3a77871002981f367cd4fe2a1b071  WireGuard-0.0.20191212.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index a494160423..3c604b3014 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20191012
+WIREGUARD_VERSION = 0.0.20191212
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
