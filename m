Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357F5C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:17:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F5161166
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A4F5161166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 662F740712;
	Mon,  4 Oct 2021 12:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Gn68sSqJjm8; Mon,  4 Oct 2021 12:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A26DF400ED;
	Mon,  4 Oct 2021 12:17:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 407291BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B4C384C45
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id na8oWZuKSQeH for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:17:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BEAD84A7F
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:17:17 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 6E57B1BF207;
 Mon,  4 Oct 2021 12:17:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXMuA-00037D-Pu; Mon, 04 Oct 2021 14:17:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Chris Packham <judge.packham@gmail.com>
References: <20210907084345.6192-1-judge.packham@gmail.com>
Date: Mon, 04 Oct 2021 14:17:14 +0200
In-Reply-To: <20210907084345.6192-1-judge.packham@gmail.com> (Chris Packham's
 message of "Tue, 7 Sep 2021 20:43:43 +1200")
Message-ID: <87zgrphtmd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/syslog-ng: Bump version to
 3.33.2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>

Please provide more details, E.G. looking at the release notes I see
that this fixes a regression in 3.33.1, so I've updated the commit
message and applied to 2021.08.x:

https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-3.33.2

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
