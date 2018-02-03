From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Feb 2018 19:56:29 +0100
Subject: [Buildroot] [git commit] wireguard: bump to version 0.0.20180202
Message-ID: <20180203190214.7FC65882B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f9971a0597c81ce513d883a990984c053119a2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 4 ++--
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index a99bba540e..1bc6599620 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,4 +1,4 @@
-# From https://lists.zx2c4.com/pipermail/wireguard/2018-January/002305.html
-sha256 463f3b402deb66b7ceac8df2d50944f32683933356455d6c1c7453926db3a8a3  WireGuard-0.0.20180118.tar.xz
+# From https://lists.zx2c4.com/pipermail/wireguard/2018-February/002350.html
+sha256 ee3415b482265ad9e8721aa746aaffdf311058a2d1a4d80e7b6d11bbbf71c722  WireGuard-0.0.20180202.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 5a4f083c6e..0b5a837a44 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20180118
+WIREGUARD_VERSION = 0.0.20180202
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
