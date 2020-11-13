From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 14:28:18 +0100
Subject: [Buildroot] [git commit branch/next]
 package/wireguard-linux-compat: bump version to 1.0.20201112
Message-ID: <20201117203828.F1BD57FB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=041cde5c26cd054ec7a822f289747856328286e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes a build issue with linux 5.4.76+.  For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-November/005997.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 833e1af2fc..8895875cf6 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-September/005817.html
-sha256  ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9  wireguard-linux-compat-1.0.20200908.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-November/005997.html
+sha256  89eae7f0c0bd6c8df3ba2e090984974ff68741a9f26aa0922890f8ca727897e1  wireguard-linux-compat-1.0.20201112.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 082d10c53b..76585e0bc4 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200908
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20201112
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
