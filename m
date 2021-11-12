Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3B6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2462460F39
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2462460F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F4F440253;
	Fri, 12 Nov 2021 22:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aEEKQ6YwzaIs; Fri, 12 Nov 2021 22:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F2F640183;
	Fri, 12 Nov 2021 22:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BA3C1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABF06827AF
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ODILzn1vp5Gg for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:12:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08E1282779
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 789158854A; Fri, 12 Nov 2021 22:08:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:09:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 76875989326d9122db272c1a0f49b92961c3f2af
X-Git-Newrev: d5ef29e9953ccff61db1e2818e2e7ef408cbd5ac
X-Patchwork-Hint: ignore
Message-Id: <20211112220833.789158854A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rpi-bt-firmware: bump
 version to 3888ba2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5ef29e9953ccff61db1e2818e2e7ef408cbd5ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog (since 883b726):

  - 3e020f7 Add 43436S firmware
            Future Zero 2 W boards will have an alternative version of 43436
            that should have different firmware, named brcmfmac43436s-sdio.

  - 3888ba2 Merge pull request #18 from HiassofT/43436S

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 3f37d964d0..7e60aa4632 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-bt-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
+sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-bt-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 13358b4fda..8d658ce435 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
+RPI_BT_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
