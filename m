From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:18:42 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 package/wireguard-linux-compat: bump version to 1.0.20200623
Message-ID: <20200716151506.8570486D37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c358002aa70fbec6a33b5d2cb530084b622aab0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Includes a number of bugfixes and updates to build against newer stable
kernels.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5a7d6bab6c81236db1e83af886433706d6e3941e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index 54af5af956..ac160cdf9d 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-May/005408.html
-sha256  98a99f2b825a82d57a7213e666f1ee4f7cc02bddb09bf4908b4b09447a8f121e  wireguard-linux-compat-1.0.20200506.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-June/005597.html
+sha256  130937724515799edf05ff8216bc837df8acda879428f3a7f96a3287758f9445  wireguard-linux-compat-1.0.20200623.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 134c4040f2..bc155a1aa6 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200506
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200623
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
