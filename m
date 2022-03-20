Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565DDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F361B4026E;
	Sun, 20 Mar 2022 21:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1Lm-13JA_S7; Sun, 20 Mar 2022 21:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1CE54022C;
	Sun, 20 Mar 2022 21:26:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5611BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A111408DE
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsbHLaFhQdTC for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:26:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D11B408B4
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:26:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A224C0004;
 Sun, 20 Mar 2022 21:26:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nW33t-00FJpt-HU; Sun, 20 Mar 2022 22:26:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yannick Brosseau <yannick.brosseau@gmail.com>
References: <20220309215531.638593-1-yannick.brosseau@gmail.com>
Date: Sun, 20 Mar 2022 22:26:05 +0100
In-Reply-To: <20220309215531.638593-1-yannick.brosseau@gmail.com> (Yannick
 Brosseau's message of "Wed, 9 Mar 2022 16:55:31 -0500")
Message-ID: <87r16wl3iq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual: Remove link to emdebian and
 replace with debian port page
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

>>>>> "Yannick" == Yannick Brosseau <yannick.brosseau@gmail.com> writes:

 > In the list of full distribution, the FAQ contains a link to Emdebian.
 > This project stopped receiving updates in 2014 and the main web page does not exist anymore.
 > This replace the entry with a link to the Debian ports page.

 > Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
