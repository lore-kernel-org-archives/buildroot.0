From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2021 08:11:31 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/wireguard-linux-compat: bump version to 1.0.20201221
Message-ID: <20210113065547.BE80F875E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8081da973e34af489bd851a0dae188bddb8db95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes a build issue with linux-rt >= 5.4.  For details, see the
announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-December/006210.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5fa51794c0615058243164b6f20d76c22208b500)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 8895875cf6..194c798570 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-November/005997.html
-sha256  89eae7f0c0bd6c8df3ba2e090984974ff68741a9f26aa0922890f8ca727897e1  wireguard-linux-compat-1.0.20201112.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-December/006210.html
+sha256  6e5289a8b602eaaf1383aebefcbc41b8ad2721269055858b150363076c1c2132  wireguard-linux-compat-1.0.20201221.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 7d6ebf0f7e..19fef05436 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20201112
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20201221
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
