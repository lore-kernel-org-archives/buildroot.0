Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5662C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A042260724
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A042260724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73EBC40179;
	Tue,  3 Aug 2021 21:53:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HnptmMy9m4Dd; Tue,  3 Aug 2021 21:53:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEDA400CE;
	Tue,  3 Aug 2021 21:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 282601BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D2AC8354D
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FvMqpklfBvG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A755383AC1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F22308B3ED; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 21:45:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1f77fce9664b9bc866bc4d4dd47eb03a00e630be
X-Git-Newrev: c56b529931247fd3b73740b51c5708bdb4391921
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.F22308B3ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: Change my name
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
Content-Type: multipart/mixed; boundary="===============3617143339286123599=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3617143339286123599==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c56b529931247fd3b73740b51c5708bdb4391921
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And remove myself from freescale related parts

Signed-off-by: André Zwing <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a69f88299..58c11543b7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -124,10 +124,7 @@ F:	package/python-docopt/
 N:	Anders Darander <anders@chargestorm.se>
 F:	package/ktap/
 
-N:	André Hentschel <nerv@dawncrow.de>
-F:	board/freescale/imx8qxpmek/
-F:	configs/freescale_imx8qxpmek_defconfig
-F:	package/freescale-imx/imx-sc-firmware/
+N:	André Zwing <nerv@dawncrow.de>
 F:	package/libkrb5/
 F:	package/openal/
 F:	package/p7zip/

--===============3617143339286123599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3617143339286123599==--
