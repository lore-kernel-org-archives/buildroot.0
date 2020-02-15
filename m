From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 19:20:19 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireguard-linux-compat: bump
 version to 0.0.20200215
Message-ID: <20200215182020.20862-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes a regression introduced in 0.0.20200214.  For details, see the
announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-February/005014.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 5c0962d85d..9e33c22f02 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-February/005013.html
-sha256  6aaed62beb23803a456b7875a56e9462125a589c9dfb6d0b672c1a8f9f3f45ab  wireguard-linux-compat-0.0.20200214.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-February/005014.html
+sha256  0def6f3608ec06f6dfc454aa5281a7c38b06ff27096cb341448d20602da4e923  wireguard-linux-compat-0.0.20200215.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 057fee7fce..747cef3e50 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200214
+WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200215
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
-- 
2.20.1
