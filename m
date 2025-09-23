Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5EACCAC5B2
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C8B741039;
	Tue, 23 Sep 2025 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iwA4DTjMtR8; Tue, 23 Sep 2025 19:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 954BC40FA7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 954BC40FA7;
	Tue, 23 Sep 2025 19:39:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D6913964
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD53B6000A
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6QZ3eFXkyPRK for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6944F61118
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6944F61118
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6381F8635D; Tue, 23 Sep 2025 19:38:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Sep 2025 21:09:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64fc708cdc8db3bd1e25ebd744e30756be3e53c1
X-Git-Newrev: ca24cd9c9b11bd634b2570f059f1187ec426b9e2
X-Patchwork-Hint: ignore
Message-Id: <20250923193857.6381F8635D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/aspeed_ast2500evb: bump U-Boot to
 2025.07
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5330096836197754391=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5330096836197754391==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ca24cd9c9b11bd634b2570f059f1187ec426b9e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/aspeed/ast2500-evb/patches/uboot/uboot.hash | 2 +-
 configs/aspeed_ast2500evb_defconfig               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/aspeed/ast2500-evb/patches/uboot/uboot.hash b/board/aspeed/ast2500-evb/patches/uboot/uboot.hash
index 0bfbf306ff..440526977b 100644
--- a/board/aspeed/ast2500-evb/patches/uboot/uboot.hash
+++ b/board/aspeed/ast2500-evb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413  u-boot-2022.01.tar.bz2
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/aspeed_ast2500evb_defconfig b/configs/aspeed_ast2500evb_defconfig
index 14b60e69ff..a955334a91 100644
--- a/configs/aspeed_ast2500evb_defconfig
+++ b/configs/aspeed_ast2500evb_defconfig
@@ -22,7 +22,7 @@ BR2_TARGET_ROOTFS_CPIO_XZ=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="evb-ast2500"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/aspeed/ast2500-evb/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y

--===============5330096836197754391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5330096836197754391==--
