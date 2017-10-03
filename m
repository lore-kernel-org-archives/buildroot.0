From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 17:31:17 +0200
Subject: [Buildroot] [git commit] wireguard: bump version to 0.0.20171001
Message-ID: <20171003152539.1DDB481103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0036e30ae652fb27bae4c011530a3bb960d6d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard/wireguard.hash | 3 ++-
 package/wireguard/wireguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
index 5bd1163..6ee22a7 100644
--- a/package/wireguard/wireguard.hash
+++ b/package/wireguard/wireguard.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7 WireGuard-0.0.20170810.tar.xz
+sha256 ecff9a184685b7dd2d81576eba5bd96bb59031c9e9b5eeee05d6dc298f30998e  WireGuard-0.0.20171001.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
index 1f2190c..e946e4c 100644
--- a/package/wireguard/wireguard.mk
+++ b/package/wireguard/wireguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_VERSION = 0.0.20170810
+WIREGUARD_VERSION = 0.0.20171001
 WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 WIREGUARD_LICENSE = GPL-2.0
