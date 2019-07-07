From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Jul 2019 08:54:55 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.1.x series
Message-ID: <20190707065330.A98528894D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd8ff25d7f14245d7ee907d4aeebd0ef7e2926d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 5.1.x bump]
(cherry picked from commit 173ed657f3ff322e523912f7cd3c651b758debe2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0f04962ee5..e522921e2d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -122,7 +122,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "4.19.56" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "4.19.57" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "v4.4.176-cip31" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
diff --git a/linux/linux.hash b/linux/linux.hash
index 6d02218926..b61b736061 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256 d011245629b980d4c15febf080b54804aaf215167b514a3577feddb2495f8a3e  linux-4.20.17.tar.xz
-sha256 7326943215b9496f302e95892457a63d9a77e0446e99dd7bade6b425bc966bdf  linux-4.19.56.tar.xz
-sha256 19f6404c30f4a9a1fe3315b902676b6d63a470be5d55cf2a0e47983c643c8ff5  linux-4.14.131.tar.xz
+sha256 327c5759d5888361d6c9d6adb0c8ad7e3c624eb05bb9e5869d9f3078dd0d3f87  linux-4.19.57.tar.xz
+sha256 da86f39a722da656fce4e2685223093b5d5f4db94046fcd79e492428a82ff330  linux-4.14.132.tar.xz
 sha256 6543232fc082485c1088830b9456e1a6e511239e4bf98817b0166ee62cafc3ca  linux-4.4.184.tar.xz
 sha256 033114d5350525dede995d31b596c31b0e26db8d77a0a1c53d36cdc36ead9faf  linux-4.9.184.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9b3111c519..ff5959ac47 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -289,8 +289,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.184"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.184"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.131"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.56"	if BR2_KERNEL_HEADERS_4_19
+	default "4.14.132"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.57"	if BR2_KERNEL_HEADERS_4_19
 	default "4.20.17"	if BR2_KERNEL_HEADERS_4_20
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
