Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB00C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7796F60FC3;
	Wed, 26 Jan 2022 20:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkwDQZAus2bU; Wed, 26 Jan 2022 20:58:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D066A60FCC;
	Wed, 26 Jan 2022 20:58:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7529A1BF4D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 638E640271
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIehvjP41EmG for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:58:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1CF415B3
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6FCAF82386; Wed, 26 Jan 2022 20:51:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:58:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9558f3d66561ef6cc24f79c1b60e2879ab144f4
X-Git-Newrev: 0ed2b74717a4557c4ffd822326530b73b7506524
X-Patchwork-Hint: ignore
Message-Id: <20220126205120.6FCAF82386@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ed2b74717a4557c4ffd822326530b73b7506524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo added by commit 7527324132878f98999539bdd97bd3518747f585:
brcmfmac-sdio-firmware-rpi by brcmfmac_sdio-firmware-rpi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c11cb846fb..62717463df 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,7 +154,7 @@ config BR2_PACKAGE_RPI_BT_FIRMWARE
 	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
 	help
 	  Package rpi-bt-firmware was moved as option to
-	  package brcmfmac-sdio-firmware-rpi.
+	  package brcmfmac_sdio-firmware-rpi.
 
 config BR2_PACKAGE_RPI_WIFI_FIRMWARE
 	bool "rpi-wifi-firmware package was renamed"
@@ -164,7 +164,7 @@ config BR2_PACKAGE_RPI_WIFI_FIRMWARE
 	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI
 	help
 	  Package rpi-wifi-firmware was moved as option to
-	  package brcmfmac-sdio-firmware-rpi.
+	  package brcmfmac_sdio-firmware-rpi.
 
 config BR2_PACKAGE_HOST_GDB_PYTHON
 	bool "GDB Python2 support removed"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
