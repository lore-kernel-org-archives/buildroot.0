Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4222C25B4F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A671411A2;
	Mon,  6 May 2024 18:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBBq0fNnAWPc; Mon,  6 May 2024 18:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 507EA4117B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 507EA4117B;
	Mon,  6 May 2024 18:59:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD7C31BF909
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C949D403AC
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CV0J9UfTf8cc for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1B47402E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1B47402E5
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:59:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAF6E86773; Mon,  6 May 2024 18:59:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 20:58:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f5cd99dd7ee82d4b977a04b0809a77f89c853c1
X-Git-Newrev: 74787fdd10543d482786fef582702bc24c1da626
X-Patchwork-Hint: ignore
Message-Id: <20240506185913.BAF6E86773@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.6.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74787fdd10543d482786fef582702bc24c1da626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 6dbbeca57f..4b20a009a7 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  1fd7ec8c3d9c4e4b3a41d11e2c6d151e5fbf875dd08b3577f73afd6ee6674605  linux-6.6.12.tar.xz
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 359b356cb4..b102dde0ba 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 194de0b530..da54eaf620 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
