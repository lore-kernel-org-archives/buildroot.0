Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CE3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD11660F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD11660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE9E405F9;
	Tue,  3 Aug 2021 23:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iEOfSk1Gjyt; Tue,  3 Aug 2021 23:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121DA405E9;
	Tue,  3 Aug 2021 23:34:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 14E2D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 618A340ED4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOfcFOAMeK9Y for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD1F440E57
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1E3078827E; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 21:46:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d8c1a6733075b080c934b03af5da46b3d25c4850
X-Git-Newrev: 07215631393f28f46f895ce43229009d2a825fc9
X-Patchwork-Hint: ignore
Message-Id: <20210803211002.1E3078827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: drop Yann
 Cardaillac
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

commit: https://git.buildroot.net/buildroot/commit/?id=07215631393f28f46f895ce43229009d2a825fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Unfortunately, this e-mail is boucing:

<ycardaillac@sepro-group.com>: host
    seprogroup-com01c.mail.protection.outlook.com[104.47.9.36] said: 550 5.4.1
    Recipient address rejected: Access denied. AS(201806281)
    [VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com] (in reply to RCPT TO
    command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 554b559f6d..c519a6cfbb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2784,9 +2784,6 @@ F:	package/casync/
 F:	package/gloox/
 F:	package/tpm2-pkcs11/
 
-N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
-F:	package/open62541/
-
 N:	Yann E. MORIN <yann.morin.1998@free.fr>
 F:	board/friendlyarm/nanopi-neo/
 F:	configs/friendlyarm_nanopi_neo_defconfig
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
