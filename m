Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A83FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:47:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4316D60EFD
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4316D60EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA114012A;
	Sat,  9 Oct 2021 20:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-BDVjZmOzy2; Sat,  9 Oct 2021 20:47:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4852B400BA;
	Sat,  9 Oct 2021 20:47:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC7A91BF3C6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A10A4041A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:47:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUtnx34VU5Je for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A01BA4041B
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:47:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0BD8594E7F; Sat,  9 Oct 2021 20:44:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 22:46:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4d5b6fd0cc997372ff939d5ff17af4310ccff07
X-Git-Newrev: 6c037932e02e4948212fc0d8c164b85812cb3f29
X-Patchwork-Hint: ignore
Message-Id: <20211009204417.0BD8594E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-bt-firmware: bump version to
 883b726
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c037932e02e4948212fc0d8c164b85812cb3f29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
  - Update CYW43455 bluetooth firmware,
    Second Spectra fix for CYW43455 (CVE-2020-10370)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 2520c91cff..3f37d964d0 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae665baa465a09dddf7f4bdec67e108a74b2a3787550cc9ee53c2bea9651f327  rpi-bt-firmware-4c47758bed7cd547dff3618a1739dcf64b5a52a7.tar.gz
+sha256  0e7fcfe75a8990815a184dc55f8fdf5d0644d351a15a7aef865ff90ff4ca8eb4  rpi-bt-firmware-883b72628de1d7efa45b421da0cbf175ac2374f8.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index f63564de99..13358b4fda 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 4c47758bed7cd547dff3618a1739dcf64b5a52a7
+RPI_BT_FIRMWARE_VERSION = 883b72628de1d7efa45b421da0cbf175ac2374f8
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
