Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C22EC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F447710B4;
	Mon, 19 May 2025 11:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOCEjsNUSaOf; Mon, 19 May 2025 11:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D94710AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D94710AA;
	Mon, 19 May 2025 11:04:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D106E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A774E41772
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxFOhZpLaGup for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84E2D41E74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84E2D41E74
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8027182A2E; Mon, 19 May 2025 10:40:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 17:50:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fe9817b215ee17d44a17c490672ab591d8c31353
X-Git-Newrev: 5aa36e173eccc4d91a91b344c643eff6c4c31a32
X-Patchwork-Hint: ignore
Message-Id: <20250519104008.8027182A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/olimex_stmp157: bump
 Linux and U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aa36e173eccc4d91a91b344c643eff6c4c31a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/olimex/stmp1_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_stmp157_olinuxino_lime_defconfig       | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
index 8691d5ffd3..48b74dae9a 100644
--- a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93  linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
+sha256  58c00229e95817918f9310f5c9adb0e3d1cfa7f28377aa7292431a110b6111a9  linux-e9b70672e21c96c02d9a731a9379baa897ea2ac7-git4.tar.gz
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
index a991a1922f..153acf3828 100644
--- a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e  uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
+sha256  1b99d3fd4fc778562c011de42193f9c29b3f2d0d7717ba22ac0c412446186382  uboot-23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9-git4.tar.gz
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index b1f9b7645a..efd267fcbf 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -12,7 +12,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc74113e14d76aea9482264ff42e07397b94553d"
+# branch release-20231222-v5.10.180
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e9b70672e21c96c02d9a731a9379baa897ea2ac7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +26,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="efadf793a0a5924e2c96362dc1df3e56622ebb97"
+# branch release-20250305, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
