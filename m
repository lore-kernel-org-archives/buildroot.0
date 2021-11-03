Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF2BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481466052B
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 481466052B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19D52814B4;
	Wed,  3 Nov 2021 21:23:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onRbpWfCR_5K; Wed,  3 Nov 2021 21:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CEED814A0;
	Wed,  3 Nov 2021 21:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 145AB1BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C1D3403A2
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ezp_6dVcMCG7 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:22:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 378EB403A7
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:22:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8E5238A4AD; Wed,  3 Nov 2021 21:18:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:19:28 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9efe3d7cd908a1a2f598ab90266bd9f778c815c7
X-Git-Newrev: f7307165906a227d646feec26f5d60008a2eae73
X-Patchwork-Hint: ignore
Message-Id: <20211103211829.8E5238A4AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Giulio
 Benetti to all Olimex Allwinner boards' defconfigs
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7307165906a227d646feec26f5d60008a2eae73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add Giulio Benetti to all Olimex Allwinner boards' defconfigs since I've
recently updated and tested them all and I'd like to receive possible
build failure from gitlab CI/CD.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1b31b4b9cef2f959915128babc5c00354f9e949f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4e9feb2a3..67d2fd21d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1018,8 +1018,10 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
 F:	package/erlang-jiffy/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
