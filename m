From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:31:17 +0100
Subject: [Buildroot] [git commit] package/wireguard-linux-compat: bump
 version to 1.0.20210219
Message-ID: <20210308072135.F21CF88918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5211e7489490620f9512e0ff2c2034af286e95b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes various compat fixes and lowers memory requirements.  For details,
see the announcement:

https://lists.zx2c4.com/pipermail/wireguard/2021-February/006404.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index f4f94cfd2e..c164a9e48e 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2021-January/006349.html
-sha256  dac6e68cd4c3db441499850dfa8a70706384a3295f37fda1b839a50b79faef54  wireguard-linux-compat-1.0.20210124.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2021-February/006404.html
+sha256  99d35296b8d847a0d4db97a4dda96b464311a6354e75fe0bef6e7c4578690f00  wireguard-linux-compat-1.0.20210219.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 2f36ec8bfb..eba5686683 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20210124
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20210219
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
