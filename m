From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Feb 2021 20:27:53 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/wireguard-linux-compat: bump version to 1.0.20210124
Message-ID: <20210203191016.9409F7FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f0312d967af43d26cec5012c08c1f14c0f6d679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes a build issue with recent 4.14.x stable kernels.  For details, see the
announcement:

https://lists.zx2c4.com/pipermail/wireguard/2021-January/006349.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ff852b0de406b3e88af3ea282ba470c68b7c8d8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 194c798570..f4f94cfd2e 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-December/006210.html
-sha256  6e5289a8b602eaaf1383aebefcbc41b8ad2721269055858b150363076c1c2132  wireguard-linux-compat-1.0.20201221.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2021-January/006349.html
+sha256  dac6e68cd4c3db441499850dfa8a70706384a3295f37fda1b839a50b79faef54  wireguard-linux-compat-1.0.20210124.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index ef21e2e114..2f36ec8bfb 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20201221
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20210124
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
