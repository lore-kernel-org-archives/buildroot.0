Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA493C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5E04273D;
	Sat, 13 May 2023 20:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5E04273D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aox9ruhw7fXL; Sat, 13 May 2023 20:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F41426FF;
	Sat, 13 May 2023 20:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F41426FF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 369521BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FCC8405BB
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCC8405BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JESXZ-AITdrI for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:40:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CC544000B
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CC544000B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39A2386617; Sat, 13 May 2023 20:40:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8361da393bf7185950810e554bdd4d5aa1285faa
X-Git-Newrev: b97f479a9fec0f430e06aad8cd45d698d9b294c1
X-Patchwork-Hint: ignore
Message-Id: <20230513204045.39A2386617@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_stmp157: bump Linux and
 U-Boot
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b97f479a9fec0f430e06aad8cd45d698d9b294c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/olimex_stmp157_olinuxino_lime_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 60c34d7fa1..3b56fefeca 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -17,8 +17,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-# branch release-20221011-v5.10.105
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1b955f3ee7ef3234f290f65dbea108063996aea0"
+# branch release-20230217-v5.10.105
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c5a31724bdfaac894553b51c5a0fb92c1f10f3db"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -35,8 +35,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-# release-20220927, based on 2021.04
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="98ab5ecb0a16eeb426f34b2a1a28e56658c1a59c"
+# release-20230110, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="9a49a20f71c698f538defbb69a6c6cb657d4315f"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
