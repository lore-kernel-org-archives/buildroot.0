From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 May 2018 19:01:22 +0200
Subject: [Buildroot] [git commit branch/next] wireguard: bump version to
 0.0.20180524
Message-ID: <20180527170712.C43818267F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6b9d59f61b9084b1ae09e26e4bac5d6a1729cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Contains a number of fixes, including fixes for building with GCC 8.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 6cfc7bb9f0..7701424e4e 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-April/002697.html
-sha256 b58cd2acf9e8d3fe9044c06c0056bd74da1f5673a456f011d36eee3f6fb1da16  WireGuard-0.0.20180420.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-May/002914.html
+sha256 57614239c1f1a99a367f2c816153acda5bffada66a3b8e3b8215f1625784abc9  WireGuard-0.0.20180524.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 20162e1d0f..ee68dc5580 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180420
+WIREGUARD_VERSION = 0.0.20180524
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
