From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jan 2020 16:56:34 +0100
Subject: [Buildroot] [PATCH] package/wireguard-linux-compat: bump version to
 0.0.20200128
Message-ID: <20200129155635.29613-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build issues with kernel 5.5. For details, see the announcement:

https://lists.zx2c4.com/pipermail/wireguard/2020-January/004905.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 0e087c033b..47715fecb1 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004870.html
-sha256 7726c2994d11913c4543fd3dc83636f7ce573ca689b15e11b83e980acc04422b  wireguard-linux-compat-0.0.20200121.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004905.html
+sha256 8610c6d8712cfd885f50b1a8c572518edf318c094d68491ea218bb50566a9a8a  wireguard-linux-compat-0.0.20200128.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 2b8e349cb9..097b80e70d 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200121
+WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200128
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
-- 
2.20.1
