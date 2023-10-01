Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3A4E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 07:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5286341726;
	Sun,  1 Oct 2023 07:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5286341726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBmDBcEMP0e4; Sun,  1 Oct 2023 07:37:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B59AA41725;
	Sun,  1 Oct 2023 07:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B59AA41725
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEB981BF5A6
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 07:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9867E81FFF
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 07:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9867E81FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hfim1eaSdx0W for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 07:37:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A06CE81FA2
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 07:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A06CE81FA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55C9940002;
 Sun,  1 Oct 2023 07:36:58 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmr0c-00G7cq-GO; Sun, 01 Oct 2023 09:36:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Petr Vorel <pevik@seznam.cz>
References: <20230930201702.985948-1-pevik@seznam.cz>
Date: Sun, 01 Oct 2023 09:36:58 +0200
In-Reply-To: <20230930201702.985948-1-pevik@seznam.cz> (Petr Vorel's message
 of "Sat, 30 Sep 2023 22:17:02 +0200")
Message-ID: <87fs2u7q05.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20230929
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
Cc: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Petr" == Petr Vorel <pevik@seznam.cz> writes:

 > From: Petr Vorel <petr.vorel@gmail.com>
 > Remove backported patch from this release.

 > Upstream commit from this release [1] very likely fixes failure
 > undefined reference to `__stack_chk_fail'.

 > [1] https://github.com/linux-test-project/ltp/commit/72891ca1efb61787cc78a81ef3e379f3fea77ac1

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
