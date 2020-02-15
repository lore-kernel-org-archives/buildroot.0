From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2020 12:04:02 +0100
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: bump
 version to 0.0.20200214
Message-ID: <20200215105640.DB9E58E094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10fe3405dfe734449d567b9e8d6a96fa5ef9e12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes misc fixes. For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-February/005013.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 0ee202ca9e..5c0962d85d 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-February/004962.html
-sha256  9669e165fc7252cab7f908ba57f160f6d57539b7cc81180f260cb675d2fd362b  wireguard-linux-compat-0.0.20200205.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-February/005013.html
+sha256  6aaed62beb23803a456b7875a56e9462125a589c9dfb6d0b672c1a8f9f3f45ab  wireguard-linux-compat-0.0.20200214.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 0efb9c3aea..057fee7fce 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200205
+WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200214
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
