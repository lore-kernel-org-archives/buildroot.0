From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  6 Feb 2020 23:21:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/wireguard-linux-compat: bump
 version to 0.0.20200205
Message-ID: <20200206222107.31981-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Includes fixes for issues found through fuzzing.  For details, see the
announcement:

https://lists.zx2c4.com/pipermail/wireguard/2020-February/004962.html

While we are at it, adjust the white space in the .hash file to match the
new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 6 +++---
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 47715fecb1..0ee202ca9e 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004905.html
-sha256 8610c6d8712cfd885f50b1a8c572518edf318c094d68491ea218bb50566a9a8a  wireguard-linux-compat-0.0.20200128.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-February/004962.html
+sha256  9669e165fc7252cab7f908ba57f160f6d57539b7cc81180f260cb675d2fd362b  wireguard-linux-compat-0.0.20200205.tar.xz
 # Locally calculated
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 097b80e70d..0efb9c3aea 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200128
+WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200205
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
-- 
2.20.1
