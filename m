Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9B3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A321B418DB;
	Thu, 17 Mar 2022 21:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvgZ6Xq9FZLP; Thu, 17 Mar 2022 21:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8446418D1;
	Thu, 17 Mar 2022 21:46:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5A021BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC7C3418D1
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:46:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SY_96oGrnKcy for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:46:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C6A2418CD
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:46:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D6AB100008;
 Thu, 17 Mar 2022 21:46:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUxwX-00DQBM-UO; Thu, 17 Mar 2022 22:46:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kris Bahnsen via buildroot <buildroot@buildroot.org>
References: <20220307211455.9630-1-kris@embeddedTS.com>
Date: Thu, 17 Mar 2022 22:46:01 +0100
In-Reply-To: <20220307211455.9630-1-kris@embeddedTS.com> (Kris Bahnsen via
 buildroot's message of "Mon, 7 Mar 2022 13:14:55 -0800")
Message-ID: <87sfrgqmli.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] fix links to Technologic Systems web
 resources
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
Cc: Julien Grossholtz <julien.grossholtz@openest.io>,
 Vivien Didelot <vivien.didelot@gmail.com>, Kris Bahnsen <kris@embeddedTS.com>,
 Mathieu Audat <mathieuaudat@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kris" == Kris Bahnsen via buildroot <buildroot@buildroot.org> writes:

 > Technologic Systems has rebranded as embeddedTS with the current
 > domain eventually going offline. Update web/doc URLs to correct
 > resource locations.

 > Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
 > ---
 > RESEND:
 >  - Was not subscribed to Buildroot list with this email

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
