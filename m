Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1E1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA782408C8;
	Sat, 15 Jan 2022 10:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ji9_Je98jdzd; Sat, 15 Jan 2022 10:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F18B5408C2;
	Sat, 15 Jan 2022 10:56:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC5B1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A0B7400C8
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDUmsfLzw8tK for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:56:07 +0000 (UTC)
X-Greylist: delayed 18:18:45 by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D6E340004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:56:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 23BB824000A;
 Sat, 15 Jan 2022 10:56:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8gj6-0007gS-Ee; Sat, 15 Jan 2022 11:56:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>
References: <20211212090107.2975294-1-christian@paral.in>
 <CA+h8R2o_bHkD2g+mJGsxMbNfDSSiOXj3wn_uhC+90xVeT-ceDA@mail.gmail.com>
Date: Sat, 15 Jan 2022 11:56:04 +0100
In-Reply-To: <CA+h8R2o_bHkD2g+mJGsxMbNfDSSiOXj3wn_uhC+90xVeT-ceDA@mail.gmail.com>
 (Christian Stewart via buildroot's message of "Thu, 6 Jan 2022
 13:39:35 -0800")
Message-ID: <8735lp5ku3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Christian" == Christian Stewart via buildroot <buildroot@buildroot.org> writes:

 > Hi maintainers, all,
 > Currently 2021.11.x branch is at version 1.17.3 which is vulnerable to:

 >  - CVE-2021-44716
 >  - CVE-2021-44717

 > Is it currently policy to backport security patches?

 > Similarly the 2021.02.x LTS branch is at 1.16.10, when the security
 > fixes landed in 1.16.12.

 > I've just submitted 1.17.6 to the list and will submit 1.16.12 for
 > 2021.02.x as well.

Committed to 2021.11.x, thanks. Sorry for the delay.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
