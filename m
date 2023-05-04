Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E212C7EE22
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 17:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C82FB40C0F;
	Thu,  4 May 2023 17:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C82FB40C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYvM3CF9pFs3; Thu,  4 May 2023 17:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC74D40C0E;
	Thu,  4 May 2023 17:36:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC74D40C0E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EB401BF3BC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B7E40C01
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08B7E40C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtOwuVXzGNST for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 17:36:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 460A940C0E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 460A940C0E
 for <buildroot@buildroot.org>; Thu,  4 May 2023 17:36:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 418F3240005;
 Thu,  4 May 2023 17:36:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pucsD-008rPS-1d; Thu, 04 May 2023 19:36:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Knight <james.d.knight@live.com>
References: <SN4P221MB0682DC54AEEF8491EF1BBDF5A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Date: Thu, 04 May 2023 19:36:09 +0200
In-Reply-To: <SN4P221MB0682DC54AEEF8491EF1BBDF5A0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 (James Knight's message of "Sat, 29 Apr 2023 15:05:50 -0400")
Message-ID: <87354c80dy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: update help links
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

>>>>> "James" == James Knight <james.d.knight@live.com> writes:

 > When browsing the help references for various systemd features, it was
 > observed that the `systemd-rfkill` link was dead (originally pointing to
 > `systemd-rfkill@.service.html`; now `systemd-rfkill.service.html`). This
 > commit corrects this link, as well as updates all other links to https
 > (since freedesktop.org now force redirects to https).

 > Signed-off-by: James Knight <james.d.knight@live.com>

Committed to 2023.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
