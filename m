Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC92EC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 20:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5871560594;
	Mon, 10 Feb 2025 20:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAn2EcWBO3tJ; Mon, 10 Feb 2025 20:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AACD60797
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AACD60797;
	Mon, 10 Feb 2025 20:50:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 040CF6C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C9660797
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FbhwfoeQVOGP for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 20:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 432EB60594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 432EB60594
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 20:50:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CE75874D6; Mon, 10 Feb 2025 20:50:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Feb 2025 21:17:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfc6aea315f2fc4169affe0bb46c22d9e4d8fa82
X-Git-Newrev: 1142a04985f45b6c733befabb97c254e387b002c
X-Patchwork-Hint: ignore
Message-Id: <20250210205021.2CE75874D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: bump uboot to 2025.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=1142a04985f45b6c733befabb97c254e387b002c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump uboot to 2025.01

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/radxa/rock5b/patches/uboot/uboot.hash | 4 ++--
 configs/rock5b_defconfig                    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/radxa/rock5b/patches/uboot/uboot.hash b/board/radxa/rock5b/patches/uboot/uboot.hash
index 904fa56c02..9acf6071ac 100644
--- a/board/radxa/rock5b/patches/uboot/uboot.hash
+++ b/board/radxa/rock5b/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+# Locally computed:
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 47a7acc083..8a4b579e58 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -38,7 +38,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/u-boot.fragment"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
