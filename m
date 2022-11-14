Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3E2C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A0E4032E;
	Mon,  5 Dec 2022 12:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A0E4032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaZ2HnCWOncq; Mon,  5 Dec 2022 12:11:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A52241684;
	Mon,  5 Dec 2022 12:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A52241684
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 138861BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F6CD408CB
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F6CD408CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZlBgk3gVbyC for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EB52408A6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EB52408A6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46A7985B9E; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 22:14:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd25808d7d3b292f61043d612c2e34aab5a422fd
X-Git-Newrev: cb51a0c9136a8f8fea92c1c60dbf4c0e9203b2a8
X-Patchwork-Hint: ignore
Message-Id: <20221205112609.46A7985B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: bump to version
 20221012
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cb51a0c9136a8f8fea92c1c60dbf4c0e9203b2a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update brcmfmac4356-sdio.vamrs,rock960.txt filename to
brcmfmac4356-sdio.AP6356S.txt due to rename:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/brcm?id=4ffcf980a535c1f26aa994ecf64a1b9d1ed6216e

Update WHENCE file hash due to date/firmware file updates.

Add missing LICENSE.ice_enhanced and LICENCE.moxa hashes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 6 ++++--
 package/linux-firmware/linux-firmware.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 382e9cb2ba..d81223e311 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  5938ee717b2023b48f6bfcf344b40ddc947e3e22c0bc36d4c3418f90fea68182  linux-firmware-20220310.tar.xz
+sha256  e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5  linux-firmware-20221012.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -14,9 +14,11 @@ sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENC
 sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
 sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
+sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
 sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
 sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
+sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
 sha256  2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c  LICENCE.qat_firmware
 sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
 sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
@@ -33,6 +35,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9  WHENCE
+sha256  6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d68733841  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 64d096df14..ea97166d93 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20220310
+LINUX_FIRMWARE_VERSION = 20221012
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -643,7 +643,7 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac4373.bin \
 	brcm/brcmfmac4330-sdio.Prowise-PT301.txt \
 	brcm/brcmfmac4356-pcie.gpd-win-pocket.txt \
-	brcm/brcmfmac4356-sdio.vamrs,rock960.txt
+	brcm/brcmfmac4356-sdio.AP6356S.txt
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
