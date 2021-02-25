From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:31:22 +0100
Subject: [Buildroot] [git commit] package/wireguard-tools: bump version to
 1.0.20210223
Message-ID: <20210308072136.077DA8896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3b292d907ace616b621748a35e22349b3286ee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2021-February/006407.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-tools/wireguard-tools.hash | 4 ++--
 package/wireguard-tools/wireguard-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-tools/wireguard-tools.hash b/package/wireguard-tools/wireguard-tools.hash
index 3bff364e06..dab7f72ca8 100644
--- a/package/wireguard-tools/wireguard-tools.hash
+++ b/package/wireguard-tools/wireguard-tools.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-August/005790.html
-sha256  51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd  wireguard-tools-1.0.20200827.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2021-February/006407.html
+sha256  1f72da217044622d79e0bab57779e136a3df795e3761a3fc1dc0941a9055877c  wireguard-tools-1.0.20210223.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-tools/wireguard-tools.mk b/package/wireguard-tools/wireguard-tools.mk
index d360c81208..d3d2069846 100644
--- a/package/wireguard-tools/wireguard-tools.mk
+++ b/package/wireguard-tools/wireguard-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_TOOLS_VERSION = 1.0.20200827
+WIREGUARD_TOOLS_VERSION = 1.0.20210223
 WIREGUARD_TOOLS_SITE = https://git.zx2c4.com/wireguard-tools/snapshot
 WIREGUARD_TOOLS_SOURCE = wireguard-tools-$(WIREGUARD_TOOLS_VERSION).tar.xz
 WIREGUARD_TOOLS_LICENSE = GPL-2.0
