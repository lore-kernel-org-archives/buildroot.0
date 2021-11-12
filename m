Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7651EC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E41E94048D;
	Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2xCg19E2XaMk; Mon,  6 Dec 2021 18:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E17040124;
	Mon,  6 Dec 2021 18:12:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CB6331BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE29860D64
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e8P12N_nDx3g for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242A560D60
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B42E781503; Mon,  6 Dec 2021 18:07:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:09:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ef29e9953ccff61db1e2818e2e7ef408cbd5ac
X-Git-Newrev: b88c545efd79ea6e287884213ed6cdab1f670e7a
X-Patchwork-Hint: ignore
Message-Id: <20211206180736.B42E781503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-wifi-firmware: bump version to
 3888ba2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b88c545efd79ea6e287884213ed6cdab1f670e7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog (since 883b726):

  - 3e020f7 Add 43436S firmware
            Future Zero 2 W boards will have an alternative version of 43436
            that should have different firmware, named brcmfmac43436s-sdio.

  - 3888ba2 Merge pull request #18 from HiassofT/43436S

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
index 3bd62306eb..09cd197dd8 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-wifi-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
+sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-wifi-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 582e0aa8f5..a467f2c7b4 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_WIFI_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
+RPI_WIFI_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
 RPI_WIFI_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_WIFI_FIRMWARE_VERSION))
 RPI_WIFI_FIRMWARE_LICENSE = PROPRIETARY
 RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
