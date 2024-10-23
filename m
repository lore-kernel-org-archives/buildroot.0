Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E52BCFA462
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B9DC40800;
	Wed, 23 Oct 2024 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrgM0z_QlGLn; Wed, 23 Oct 2024 19:53:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF45240806
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF45240806;
	Wed, 23 Oct 2024 19:53:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 629FD4960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4206E606CF
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8B6RU1bfCtp for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:53:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 792DB6062A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 792DB6062A
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:53:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63154863DF; Wed, 23 Oct 2024 19:53:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 21:53:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af27e44bb2a0fedd249b180989a300da58f52c1f
X-Git-Newrev: 3b21ab07c541c9582b03b0d07d2a87d0b8da2e29
X-Patchwork-Hint: ignore
Message-Id: <20241023195317.63154863DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglev_fire: Bump U-Boot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3b21ab07c541c9582b03b0d07d2a87d0b8da2e29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to latest release tag: linux4microchip+fpga-2024.09. This
includes the latest features and bug fixes.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index 2628d4b4fd..cb0ec5ec52 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
+sha256  a2fad7fe7f933fa4679b070e952e1e7a21dbd8b586d7a9a11bfcb99e75ae7ad6  uboot-linux4microchip+fpga-2024.09.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 5e1faf41b9..e6e717f6b8 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.09)/uboot-linux4microchip+fpga-2024.09.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
