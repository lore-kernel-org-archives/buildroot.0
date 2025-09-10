Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DE1CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6557240A3C;
	Wed, 10 Sep 2025 11:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJ1LevLQrO-B; Wed, 10 Sep 2025 11:31:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 796C640A23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796C640A23;
	Wed, 10 Sep 2025 11:31:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B00110E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00DCF40F72
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qsGc7ivMp3T for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF24405D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EF24405D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:31:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E04183CFF; Wed, 10 Sep 2025 11:31:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Sep 2025 13:21:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebf0131e3e832e125c7fb1d9cd333e558eca663d
X-Git-Newrev: b401a61f35dde14505f0f22f3bebf01af1e37290
X-Patchwork-Hint: ignore
Message-Id: <20250910113139.3E04183CFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/ti-k3-boot-firmware: bump to 11.01.12
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b401a61f35dde14505f0f22f3bebf01af1e37290
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest tagged version of ti-linux-firmware to pull in
updates for TI's DM and TIFS firmware for TI's K3 processors

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
 boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
index 2396948381..d94590e705 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
-sha256  e98ae3350964100b6137d32d4874c16229a97b1cc7f8f4f23f8da59a386520c8  ti-k3-boot-firmware-11.00.11.tar.gz
+sha256  eda8af01e1c142e3ebe766877585ac4f37e4f1dc4ad5fe29ad15c120c18ccece  ti-k3-boot-firmware-11.01.12.tar.gz
diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
index 25956be68b..7689071a4c 100644
--- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
+++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
+TI_K3_BOOT_FIRMWARE_VERSION = 11.01.12
 TI_K3_BOOT_FIRMWARE_SITE = $(call github,TexasInstruments,ti-linux-firmware,$(TI_K3_BOOT_FIRMWARE_VERSION))
 TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
 TI_K3_BOOT_FIRMWARE_LICENSE = TI Proprietary
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
