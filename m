Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9106FE77188
	for <buildroot@archiver.kernel.org>; Tue, 14 Jan 2025 22:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54BB0413DA;
	Tue, 14 Jan 2025 22:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46Y6E0thLIXI; Tue, 14 Jan 2025 22:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A34413BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A34413BF;
	Tue, 14 Jan 2025 22:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCCF5B8B
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9DA480E4D
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:13:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWLsTl9_iLne for <buildroot@buildroot.org>;
 Tue, 14 Jan 2025 22:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF51C80E4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF51C80E4E
 for <buildroot@buildroot.org>; Tue, 14 Jan 2025 22:13:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB2A685CB9; Tue, 14 Jan 2025 22:13:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 22:16:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ffc6ae7d9c375e953ea9c32530b15a5c79afa4c
X-Git-Newrev: cfe69076bbe99a3a6381b5d3e4e4a3fa3bcb0e30
X-Patchwork-Hint: ignore
Message-Id: <20250114221322.AB2A685CB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-arm-arm: bump to 14.2.rel1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cfe69076bbe99a3a6381b5d3e4e4a3fa3bcb0e30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested with qemu_arm_vexpress_defconfig.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../toolchain-external/toolchain-external-arm-arm/Config.in    | 10 +++++-----
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.hash |  8 ++++----
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk   |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 683854e05e..7b1a7fb27f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,23 +3,23 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 13.3.rel1"
+	bool "Arm ARM 14.2.rel1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 13.3,
-	  GDB 14, glibc 2.38, Binutils 2.42. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 14.2,
+	  GDB 15, glibc 2.40, Binutils 2.43. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 6d4facfdad..9a657a5ed4 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  560267bdecf966b7a48467d0af6c81a85b906ef7b0a9b9dd91f506184b940281  arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  377d11ec2b55c55306d435d3f2e3760f92efafa649393d5b6778457b3c8af1ab  arm-gnu-toolchain-13.3.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912  arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  3fe832f9c831323a37ff54bfb5ac7a083acdd473f2c93feaf0cb3c1ac690d739  arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 84e0e18276..86937a7412 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 13.3.rel1
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
