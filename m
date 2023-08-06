Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80388EC8733
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A05380B48;
	Thu,  7 Sep 2023 15:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A05380B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LALyPGNZFgEH; Thu,  7 Sep 2023 15:13:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76442812FE;
	Thu,  7 Sep 2023 15:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76442812FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD571BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3365B41D78
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3365B41D78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsiaRBBUeajK for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3401A41D8C
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3401A41D8C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DD7E86A20; Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 19:32:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c4e46c1ebdd2b200fc67acd0b59de238499106
X-Git-Newrev: 89d39912f9520ac542a5936574be434546cf3421
X-Patchwork-Hint: ignore
Message-Id: <20230907145127.1DD7E86A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/imx-sc-firmware:
 bump version to 1.15.0
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
Content-Type: multipart/mixed; boundary="===============3594754420690169085=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3594754420690169085==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=89d39912f9520ac542a5936574be434546cf3421
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The COPYING and EULA files have changed, with the following main
changes:
- update to copyright years
- switch from ASCCI double quotes to fancy Unicode ones ("" -> “”)
- reflow the license text
- identify new third-parties and their conditions

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash | 6 +++---
 package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
index ed83e757af..a5bbe11268 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  24a647237c0077ce0172563d67fcbc5e8f231bad7cf55a2436848c89579c5a06  imx-sc-firmware-1.8.0.bin
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
+sha256  1272ac5c31a88017ef548721f3acf930a7eda6ac73aa9f41b5f0cade9d5c0e5f  imx-sc-firmware-1.15.0.bin
+sha256  654f0c4ce6d08f9a6d74e29c58206742cb7469a6a7c25413028a9bdbe647aa13  EULA
+sha256  5bd7aab9dc380a6f9577443b2e90bd5ca73d9528175fad04b6d17da43a05a48e  COPYING
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
index 6a304c0c8c..3452e8b0eb 100644
--- a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_SC_FIRMWARE_VERSION = 1.8.0
+IMX_SC_FIRMWARE_VERSION = 1.15.0
 IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
 IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
 

--===============3594754420690169085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3594754420690169085==--
