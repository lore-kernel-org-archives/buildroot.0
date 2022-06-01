Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CF4C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D816409DE;
	Wed,  1 Jun 2022 21:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AbS2dCIWrkcT; Wed,  1 Jun 2022 21:22:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5700F409C8;
	Wed,  1 Jun 2022 21:22:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95E6B1BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857FA831F5
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkqRExp6cxAp for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:22:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8E20831DE
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:22:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 92E12240003;
 Wed,  1 Jun 2022 21:22:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nwVne-0096k3-Nw; Wed, 01 Jun 2022 23:22:42 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Markus Mayer via buildroot <buildroot@buildroot.org>
References: <20220527184501.1992852-1-mmayer@broadcom.com>
Date: Wed, 01 Jun 2022 23:22:42 +0200
In-Reply-To: <20220527184501.1992852-1-mmayer@broadcom.com> (Markus Mayer via
 buildroot's message of "Fri, 27 May 2022 11:45:01 -0700")
Message-ID: <8735go2i59.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/strace: download from Github
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
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Markus" == Markus Mayer via buildroot <buildroot@buildroot.org> writes:

 > Some corporate networks may be blocking access to Russian servers.
 > The server "strace.io" is in Russia, which will make it inaccessible
 > from some networks.

 > Use Github instead to download the sources.

 > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
 > ---

 > Not sure if there is a precedence for such a change or if it'll be deemed
 > acceptable. I am putting this out there in case it is considered helpful.

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
