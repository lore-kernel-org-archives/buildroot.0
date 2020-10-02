From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:11:46 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/wireguard-linux-compat: bump version to 1.0.20200908
Message-ID: <20201002082517.CA83081EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec5172e2f653cadd405928972532a63cf38875c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes a race condition. For details, see the announcement:
https://lists.zx2c4.com/pipermail/wireguard/2020-September/005817.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d8cb637442861985a05efcfff4ca9ce99dfb3f4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireguard-linux-compat/wireguard-linux-compat.hash | 4 ++--
 package/wireguard-linux-compat/wireguard-linux-compat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.hash b/package/wireguard-linux-compat/wireguard-linux-compat.hash
index ac160cdf9d..833e1af2fc 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.hash
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.hash
@@ -1,4 +1,4 @@
-# https://lists.zx2c4.com/pipermail/wireguard/2020-June/005597.html
-sha256  130937724515799edf05ff8216bc837df8acda879428f3a7f96a3287758f9445  wireguard-linux-compat-1.0.20200623.tar.xz
+# https://lists.zx2c4.com/pipermail/wireguard/2020-September/005817.html
+sha256  ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9  wireguard-linux-compat-1.0.20200908.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireguard-linux-compat/wireguard-linux-compat.mk b/package/wireguard-linux-compat/wireguard-linux-compat.mk
index 5e8636072c..082d10c53b 100644
--- a/package/wireguard-linux-compat/wireguard-linux-compat.mk
+++ b/package/wireguard-linux-compat/wireguard-linux-compat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200623
+WIREGUARD_LINUX_COMPAT_VERSION = 1.0.20200908
 WIREGUARD_LINUX_COMPAT_SITE = https://git.zx2c4.com/wireguard-linux-compat/snapshot
 WIREGUARD_LINUX_COMPAT_SOURCE = wireguard-linux-compat-$(WIREGUARD_LINUX_COMPAT_VERSION).tar.xz
 WIREGUARD_LINUX_COMPAT_LICENSE = GPL-2.0
