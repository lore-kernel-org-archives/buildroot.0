From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Oct 2017 16:55:18 +0200
Subject: [Buildroot] [git commit] wireguard: bump to version 0.0.20171005
Message-ID: <20171006144821.61D7481188@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb4c089eaf365f1f8c7889bd371b588696604b0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 3 ++-
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 6ee22a7..1f55b7a 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,3 +1,4 @@
+# From https://lists.zx2c4.com/pipermail/wireguard/2017-October/001791.html
+sha256 832a3b7cbb510f6986fd0c3a6b2d86bc75fc9f23b6754d8f46bc58ea8e02d608  WireGuard-0.0.20171005.tar.xz
 # Locally calculated
-sha256 ecff9a184685b7dd2d81576eba5bd96bb59031c9e9b5eeee05d6dc298f30998e  WireGuard-0.0.20171001.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index e946e4c..0ecb900 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20171001
+WIREGUARD_VERSION = 0.0.20171005
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
