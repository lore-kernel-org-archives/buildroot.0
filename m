From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Apr 2020 17:27:58 +0200
Subject: [Buildroot] [git commit] package/wireguard-tools: bump version to
 1.0.20200319
Message-ID: <20200404151744.3F7868A68D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11036ca0d21889f1e80ca68de8a8fcdc020700bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index 9ea0d3ce86..475a7450a9 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-February/004963.html
-sha256  f5207248c6a3c3e3bfc9ab30b91c1897b00802ed861e1f9faaed873366078c64  wireguard-tools-1.0.20200206.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-March/005191.html
+sha256  757ed31d4d48d5fd7853bfd9bfa6a3a1b53c24a94fe617439948784a2c0ed987  wireguard-tools-1.0.20200319.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index c2b2c36651..fc2ec876b3 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20200206
+WIREGUARD_TOOLS_VERSION = 1.0.20200319
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
