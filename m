From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  3 Apr 2020 11:30:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/wireguard-linux-compat: bump
 version to 1.0.20200401
Message-ID: <20200403093040.13425-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matching the now-mainline wireguard code in kernel 5.6.

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-April/005237.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 9e33c22f02..a9675b5180 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-February/005014.html
-sha256  0def6f3608ec06f6dfc454aa5281a7c38b06ff27096cb341448d20602da4e923  wireguard-linux-compat-0.0.20200215.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-April/005237.html
+sha256  7dfb4a8315e1d6ae406ff32d01c496175df558dd65968a19e5222d02c7cfb77a  wireguard-linux-compat-1.0.20200401.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 747cef3e50..d5a2341d77 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200215
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200401
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
-- 
2.20.1
