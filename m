Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC59C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0237F61165
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0237F61165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FA9832D8;
	Wed, 13 Oct 2021 19:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mXfn20oyfXT; Wed, 13 Oct 2021 19:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A18D832D0;
	Wed, 13 Oct 2021 19:38:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 432571BF9C6
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EF5760AFC
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTrOI7CypaXz for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99DEB60AE1
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E1C7B95B2E; Wed, 13 Oct 2021 19:35:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 20:50:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 268def331ab983789da2dfd2bef2b411a11f4b30
X-Git-Newrev: 9b0280320c16b0d653c79b5ed6bdd555a2fbf48c
X-Patchwork-Hint: ignore
Message-Id: <20211013193533.E1C7B95B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: bump
 version to 8.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b0280320c16b0d653c79b5ed6bdd555a2fbf48c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match NXP 5.10.35-2.0.0 release.

Various updates to the license files, but still NXP license.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index c434ce7ebd..98a0e73048 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1a7aaab69cd8c48d10ffb0118c938f4b3daf4c7fd86f0342f4d352906f8e0ecb  firmware-imx-8.11.bin
-sha256  4f3cc2dcbe3b7369bd4a51df749f432b69d8189fc2bde88f9fadbec73c686683  COPYING
-sha256  a07e8df685161553d7e0b78b8b93ebe9086d95bb8635abff0ed3247992181e85  EULA
+sha256  6b6747bf36ecc53e385234afdce01f69c5775adf0d6685c885281ca6e4e322ef  firmware-imx-8.12.bin
+sha256  ea58636bf34f589048fcd46e38497c47229fde8498df086ff5fb52f9ef8e15ee  COPYING
+sha256  50099e283cfd307f84f159aeb1a6f462351320273dbcdb80d7f2c9db0494b71c  EULA
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 29241342be..60c97fd2b8 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = 8.11
+FIRMWARE_IMX_VERSION = 8.12
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
