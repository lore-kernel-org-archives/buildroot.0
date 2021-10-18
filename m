Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17C3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:53:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 820EE6103D
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 820EE6103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5590D60AF2;
	Tue, 19 Oct 2021 17:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQNVhIG9W8Bj; Tue, 19 Oct 2021 17:53:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8B5C60855;
	Tue, 19 Oct 2021 17:53:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E13E1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B41240134
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAh9F9Rf-MRq for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:53:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23457400CB
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:53:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 24E881C0003;
 Tue, 19 Oct 2021 17:53:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mctIp-0005XS-GS; Tue, 19 Oct 2021 19:53:31 +0200
Resent-To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Resent-From: Peter Korsgaard <peter@korsgaard.com>
Resent-Date: Tue, 19 Oct 2021 19:53:31 +0200
Resent-Message-ID: <871r4gc350.fsf@dell.be.48ers.dk>
X-From-Line: nobody Mon Oct 18 14:38:46 2021
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211005202232.32172-1-ps.report@gmx.net>
Date: Mon, 18 Oct 2021 14:38:46 +0200
In-Reply-To: <20211005202232.32172-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 5 Oct 2021 22:22:32 +0200")
Message-ID: <87czo2ecdl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/log4cplus: bump version to 2.0.7
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > For details see [1].
 > [1] https://github.com/log4cplus/log4cplus/releases/tag/REL_2_0_7

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
