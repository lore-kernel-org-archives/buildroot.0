Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C088C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D305941A17;
	Fri, 12 Jul 2024 14:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTPUAwWXi8yq; Fri, 12 Jul 2024 14:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78CB841A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78CB841A5B;
	Fri, 12 Jul 2024 14:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C28B1BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8964D4043E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwF5qTXhj3na for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E796E40185
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E796E40185
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:42:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D482386009; Fri, 12 Jul 2024 14:42:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:42:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4516c6c5d04878874545f32e1ca253505c228ed4
X-Git-Newrev: 51b4421758e5ccba0f051672ccd28bc3114948d9
X-Patchwork-Hint: ignore
Message-Id: <20240712144244.D482386009@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi*: bump kernel version
 to 17f135b (6.6.28)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5786492761857687956=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5786492761857687956==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51b4421758e5ccba0f051672ccd28bc3114948d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now based on 6.6.28 (from 6.1.61).

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
Tested-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/patches/linux/linux.hash | 2 +-
 configs/raspberrypi0_defconfig             | 8 ++++----
 configs/raspberrypi0w_defconfig            | 8 ++++----
 configs/raspberrypi2_defconfig             | 8 ++++----
 configs/raspberrypi3_64_defconfig          | 6 +++---
 configs/raspberrypi3_defconfig             | 8 ++++----
 configs/raspberrypi3_qt5we_defconfig       | 6 +++---
 configs/raspberrypi4_64_defconfig          | 6 +++---
 configs/raspberrypi4_defconfig             | 8 ++++----
 configs/raspberrypi5_defconfig             | 6 +++---
 configs/raspberrypi_defconfig              | 8 ++++----
 configs/raspberrypicm4io_64_defconfig      | 6 +++---
 configs/raspberrypicm4io_defconfig         | 8 ++++----
 configs/raspberrypizero2w_defconfig        | 8 ++++----
 14 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
index 2843b7023d..8d43c25151 100644
--- a/board/raspberrypi/patches/linux/linux.hash
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4d3a2af178ac6ed8f35b773836c8d216493a850aeb80932b379348e2df0cf5d2  linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz
+sha256  dab3052783c68c46a5bc645b1c38d9705da995ab42823566518b62eb1fa1ef97  linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 74a8477cc6..b2b7351ac1 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -6,20 +6,20 @@ BR2_ARM_EABIHF=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B from the kernel sources: the zero is the same
 # as the A+ model, just in a different form-factor
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 03f6a805e6..a198596b40 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -6,17 +6,17 @@ BR2_ARM_EABIHF=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 79de3fbf3e..05870cc6e1 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -11,17 +11,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 5460cd8c62..ec309b2bad 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -10,12 +10,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index eded94014d..ba2d5b6eed 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -10,17 +10,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 72e1c349f2..38f41f45a6 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -11,12 +11,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index 8da3ecee12..5c6698fb37 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -10,12 +10,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 2c37631396..c14b77eacd 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -10,17 +10,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-4-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 73592c4a1a..3c88ce46cd 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -6,13 +6,13 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index c911ec63e9..03c81ebf39 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -8,19 +8,19 @@ BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 
 # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-cm"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 75077263e4..e9d57091b5 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -10,12 +10,12 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 07adb962a4..537d077b71 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -10,17 +10,17 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2711-rpi-cm4"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 0b1457f407..37922909f3 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -6,19 +6,19 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 
-# Linux headers same as kernel, 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,17f135b742c4edb340afb365873c3a574f7e16cb)/linux-17f135b742c4edb340afb365873c3a574f7e16cb.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-zero-2-w"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y

--===============5786492761857687956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5786492761857687956==--
