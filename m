From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 17:35:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/wireguard-linux-compat: bump to
 version 1.0-20200121
In-Reply-To: <20200121163519.10171-1-peter@korsgaard.com>
References: <20200121163519.10171-1-peter@korsgaard.com>
Message-ID: <20200121163519.10171-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-January/004870.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 1653eaa089..0e087c033b 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004844.html
-sha256 9f12f68e96f6865325995c38213e09b05751cd1ef03e0bbc9f1bdc3e5680b337  wireguard-linux-compat-0.0.20200105.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-January/004870.html
+sha256 7726c2994d11913c4543fd3dc83636f7ce573ca689b15e11b83e980acc04422b  wireguard-linux-compat-0.0.20200121.tar.xz
 # Locally calculated
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index ddceed5660..2b8e349cb9 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200105
+WIREGUARD_LINUX_COMPAT_VERSION = 0.0.20200121
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
-- 
2.20.1
