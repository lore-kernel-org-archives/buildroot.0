From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:18:33 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/wireguard-linux-compat: bump version to 1.0.20200506
Message-ID: <20200716151506.7C52C86D37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f18425d768af5f40536a813a06e7121f43678f54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Synchronizes with upstream 5.7-rc5.  For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-May/005408.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3564bc165994cb72fbedfa6cf178c08273d56a82)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index d308f47a13..54af5af956 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-April/005296.html
-sha256  cf166348fbb67419528e73049ce001d29131aea367fa6aef9d3e223f7251e116  wireguard-linux-compat-1.0.20200413.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-May/005408.html
+sha256  98a99f2b825a82d57a7213e666f1ee4f7cc02bddb09bf4908b4b09447a8f121e  wireguard-linux-compat-1.0.20200506.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 27f5981ae3..134c4040f2 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200413
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200506
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
