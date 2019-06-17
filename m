From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:03:40 +0200
Subject: [Buildroot] [git commit] package/wireguard: bump version to
 0.0.20190601
Message-ID: <20190617190341.659088F598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a3f8e89357b536ec4476de937869e7415eebcbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details of the changes, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2019-June/004196.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index d23fe500a2..9546ebd0f2 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2019-April/004062.html
-sha256 2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b  WireGuard-0.0.20190406.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2019-June/004196.html
+sha256 7528461824a0174bd7d4f15e68d8f0ce9a8ea318411502b80759438e8ef65568  WireGuard-0.0.20190601.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 8686bed4f9..c52e942c18 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20190406
+WIREGUARD_VERSION = 0.0.20190601
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
