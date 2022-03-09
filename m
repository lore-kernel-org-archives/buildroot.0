Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401CFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 20:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B9160FAC;
	Wed,  9 Mar 2022 20:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yH0-qPASEP_8; Wed,  9 Mar 2022 20:29:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82FD360F8C;
	Wed,  9 Mar 2022 20:29:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E62721BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5E528413F
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 20:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xadnaZnLMXtR for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 20:29:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECCD18412C
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 20:29:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C32ABC000B;
 Wed,  9 Mar 2022 20:29:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nS2vh-002Noj-K5; Wed, 09 Mar 2022 21:29:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan Havran <jan.havran@audified.com>
References: <YiXRxFsrmOttLX0v@jan-lenovo>
Date: Wed, 09 Mar 2022 21:29:05 +0100
In-Reply-To: <YiXRxFsrmOttLX0v@jan-lenovo> (Jan Havran's message of "Mon, 7
 Mar 2022 10:35:00 +0100")
Message-ID: <87lexi27la.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/jack2: bump to version 1.9.20
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
Cc: "Wojciech M. Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jan" == Jan Havran <jan.havran@audified.com> writes:

 > - Fix URL for 'JACK DBus packaging' GitHub Wiki page.
 > https://github.com/jackaudio/jack2/releases/tag/v1.9.18
 > https://github.com/jackaudio/jack2/releases/tag/v1.9.19
 > https://github.com/jackaudio/jack2/releases/tag/v1.9.20

 > Signed-off-by: Jan Havran <jan.havran@audified.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
