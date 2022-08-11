Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3A0C19F2D
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33C5C610CB;
	Thu, 11 Aug 2022 11:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33C5C610CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEQOTwt9eZ3s; Thu, 11 Aug 2022 11:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F4B610C0;
	Thu, 11 Aug 2022 11:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F4B610C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 35D571C116E
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F38B4038D
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F38B4038D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwq4SoV5mywy for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67A3940382
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67A3940382
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4E477870FC; Thu, 11 Aug 2022 10:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 12:58:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61ae6add9e5d4761536fa4ff24150d5f8f82a61d
X-Git-Newrev: 1d8a1268a3aa621fd7a5559f6f27526c2eb04b28
X-Patchwork-Hint: ignore
Message-Id: <20220811104614.4E477870FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: bump
 version to 8.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d8a1268a3aa621fd7a5559f6f27526c2eb04b28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

New version contains updated binaries which are part of the NXP
5.15.5-1.0.0 Yocto release.

Update the license hashes for formatting changes and addition of
LC3plus/T2/Bluetooth SIG licenses.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
[Peter: add SCR.txt license file as suggested by Stefan Hager]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 7 ++++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 98a0e73048..eb0c387af3 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,5 @@
 # Locally calculated
-sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
-sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
-sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
+sha256  937e196476b8e95b4b7f2501a14c8326d8a0649f8a3f9228b72373770a08deb3  firmware-imx-8.15.bin
+sha256  35188e65dbb9c7da4bbcb77c7726e835607f9f41b8b44149806ea51429ca9a31  COPYING
+sha256  30f61825583b4c26d29a798ad7e4c8ef2f2f390b1e964af302d2dc40e93cb0a4  EULA
+sha256  40d02f6d6b4e94d9307529408f372f5a9908cf3d156ec533a4e54274b40f271e  SCR.txt
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 211a43c4ca..47c21585aa 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.12
+FIRMWARE_IMX_VERSION = 8.15
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
 FIRMWARE_IMX_LICENSE = NXP Semiconductor Software License Agreement
-FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
+FIRMWARE_IMX_LICENSE_FILES = EULA COPYING SCR.txt
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
 FIRMWARE_IMX_INSTALL_IMAGES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
