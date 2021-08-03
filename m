Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B844C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:26:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C161B60F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C161B60F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F9E342578;
	Sat,  4 Sep 2021 18:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZerHVVwGHduf; Sat,  4 Sep 2021 18:26:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB0542564;
	Sat,  4 Sep 2021 18:26:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3507A1BF95F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8576E401FB
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bt8ZNGCqaEpW for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AFD5400E5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2F00F8834A; Sat,  4 Sep 2021 18:23:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:09:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d89c4ae919ffe6faa7e921702ef80770a8b27b87
X-Git-Newrev: a2de01e75a934f3b56c2a1331ceaac95f3face46
X-Patchwork-Hint: ignore
Message-Id: <20210904182352.2F00F8834A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump to version 5.13
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a2de01e75a934f3b56c2a1331ceaac95f3face46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
