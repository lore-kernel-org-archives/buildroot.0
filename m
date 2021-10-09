Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E42C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:41:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE7F60E9B
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 17:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAE7F60E9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 635D6832C7;
	Sat,  9 Oct 2021 17:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AvRZBomcEWdZ; Sat,  9 Oct 2021 17:41:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAFBB832AA;
	Sat,  9 Oct 2021 17:41:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 658201BF5F8
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6E54025B
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 17:41:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyDOLTijU4EP for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 17:41:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03F7D400A8
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 17:41:24 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DC02A240004;
 Sat,  9 Oct 2021 17:41:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mZGLY-0004r5-Rf; Sat, 09 Oct 2021 19:41:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20211005200644.8006-1-ps.report@gmx.net>
 <87o87yv66d.fsf@dell.be.48ers.dk>
Date: Sat, 09 Oct 2021 19:41:20 +0200
In-Reply-To: <87o87yv66d.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 09 Oct 2021 12:33:30 +0200")
Message-ID: <87sfxart8f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/gst1-interpipe: bump version to
 1.1.6
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
 >> Changelog (for details see [1]):
 >> - Fix for memory corruption issue when listening to same node (#99)

 >> [1] https://github.com/RidgeRun/gst-interpipe/releases/tag/1.1.6

 >> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 > Committed, thanks.

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
