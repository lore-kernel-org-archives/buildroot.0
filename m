Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C7C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96C30408D1;
	Mon,  6 Jun 2022 12:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id idvNScTQeSOA; Mon,  6 Jun 2022 12:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8D8F40408;
	Mon,  6 Jun 2022 12:16:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7EBCA1BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D35A40408
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id honK69Rme4lo for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:16:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07544400DB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:16:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE266C0005;
 Mon,  6 Jun 2022 12:16:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyBeM-00Cov1-TZ; Mon, 06 Jun 2022 14:16:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220517200923.1516695-1-james.hilliard1@gmail.com>
 <7585dcea-4e32-a582-e138-e7e225609398@gmail.com>
 <CADvTj4re+hCC9n=HRMsLQ+SaEPPH=XBkCG83mTp_U79rr9Nvyg@mail.gmail.com>
 <e3350a95-d9ca-8d7d-0f48-22c86289a3db@gmail.com>
 <CADvTj4rWQx=g3MK6AoV7bbRS7ZOA4K7SMR2Qb+OhaOdX4y8odg@mail.gmail.com>
 <20220529214657.GM993669@scaer>
 <CADvTj4rxnoRp-ZZPhfB2ANhw3+294F97A2smcmhULR4WfDsqrg@mail.gmail.com>
Date: Mon, 06 Jun 2022 14:16:02 +0200
In-Reply-To: <CADvTj4rxnoRp-ZZPhfB2ANhw3+294F97A2smcmhULR4WfDsqrg@mail.gmail.com>
 (James Hilliard's message of "Sun, 29 May 2022 16:20:19 -0600")
Message-ID: <878rqaxa0t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask: bump to version
 2.1.2
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
Cc: Lionel Flandrin <lionel@svkt.org>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

Hi,

 >> We were really late in this cycle, but rc1 was tagged on the 18th, just
 >> a day after you sent your python bumps, so they could not all be
 >> applied, except for python-flask and python-werkzeug which do fix a
 >> runtime test.
 >> 
 >> If the rest are related to the flask and werkzeug and need to be updated
 >> together in lock-step, then they should have been grouped in a series
 >> together.

 > Yeah, the individual bumps were for stuff that was broken already due to
 > pyyaml breakage so was a little too late by that point to do a proper series
 > since everything flask related was kinda already broken.

 > I did a series for python-flask-jsonrpc which fixes compatibility with the
 > newer flask version:
 > https://patchwork.ozlabs.org/project/buildroot/list/?series=300745

 > These are reverse dep bumps needed for compatibility with latest
 > python-flask:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220517202422.1522574-1-james.hilliard1@gmail.com/
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220517202805.1524501-1-james.hilliard1@gmail.com/
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220517203235.1525998-1-james.hilliard1@gmail.com/
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220517220253.1554088-1-james.hilliard1@gmail.com/

 > I think these are all part of the python-flask update dependency tree and
 > should be applied as well to prevent potential compatibility issues:
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220517201550.1519884-1-james.hilliard1@gmail.com/
 > https://patchwork.ozlabs.org/project/buildroot/patch/20220517201916.1521398-1-james.hilliard1@gmail.com/

Is any of this needed for 2022.02.x as well?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
