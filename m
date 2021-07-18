Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B930DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:45:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C036103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75C036103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DB083E92;
	Tue,  3 Aug 2021 23:45:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JF_JPWFjHMtV; Tue,  3 Aug 2021 23:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5BF483E6C;
	Tue,  3 Aug 2021 23:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A6931BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4D0540F31
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQET1rdBuNot for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE86240EC2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 42E4A87059; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 22:35:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 747e2eed880b70c085bb93b34a6e1558ae49b6d0
X-Git-Newrev: f64e93cd02ae3fc99918d619dd367f143389e29f
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.42E4A87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 configs/raspberrypicm4io_defconfig: fix typo (missing '=y')
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f64e93cd02ae3fc99918d619dd367f143389e29f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/raspberrypicm4io_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index febaedd9e6..f4ba22dfe5 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -29,7 +29,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Required tool to flash CM4 eMMC memory
-BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
 
 # Filesystem / image
 BR2_TARGET_ROOTFS_EXT2=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
