Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6854EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 22:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CB0F40A06;
	Mon, 27 Jun 2022 22:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CB0F40A06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHteADqkRjOY; Mon, 27 Jun 2022 22:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18B1E40AB4;
	Mon, 27 Jun 2022 22:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18B1E40AB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C84D81BF2F0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0960408D4
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 22:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0960408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDyEQ7dLEn3m for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 22:08:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 827F8408D0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 827F8408D0
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 22:08:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C44401C0002;
 Mon, 27 Jun 2022 22:08:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o5wu8-00D4Rg-UA; Tue, 28 Jun 2022 00:08:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20220625043409.70939-1-bernd.kuhls@t-online.de>
Date: Tue, 28 Jun 2022 00:08:24 +0200
In-Reply-To: <20220625043409.70939-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 25 Jun 2022 06:34:09 +0200")
Message-ID: <87h745vjxj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.18.0
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

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Removed patch, not needed anymore due to upstream removal of astrobwt:
 > https://github.com/xmrig/xmrig/commit/22d6a7525e0e5d117d2518906ae86adbc4e65be9

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
