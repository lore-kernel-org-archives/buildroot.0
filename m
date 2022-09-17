Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E646BECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 10:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A8AE40399;
	Sat, 17 Sep 2022 10:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8AE40399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnBQW60YDlnZ; Sat, 17 Sep 2022 10:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 772E5402FE;
	Sat, 17 Sep 2022 10:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 772E5402FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 561021BF5A4
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A57541D85
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 10:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A57541D85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bChzOYkIlv8o for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 10:57:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15CA041D81
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 10:57:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15CA041D81
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01E03841D2; Sat, 17 Sep 2022 10:57:47 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 12:57:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc8aafa98b4578385e547046fd6c613830d334b2
X-Git-Newrev: 8dfcb51bd9900061f03387a1bf6b9598afc349be
X-Patchwork-Hint: ignore
Message-Id: <20220917105748.01E03841D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-cadence-dp-firmware: bump to
 version lsdk2012
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dfcb51bd9900061f03387a1bf6b9598afc349be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash | 6 +++---
 package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
index 88ac3db977..6e5c761463 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
-sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
-sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+sha256  e267655a47fbe118f6960bca7994bd6b8986ef955344fe006a424be96f868602  firmware-cadence-lsdk2012.bin
+sha256  9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  COPYING
+sha256  72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
 sha256  53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  EULA.txt
diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
index 8cc2200a1a..2ccdd8b903 100644
--- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
+++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
+QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk2012
 QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
 QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
 QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
