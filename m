Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3768EC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 12:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96BD8821CE;
	Wed, 30 Aug 2023 12:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96BD8821CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBRHywUJiUe5; Wed, 30 Aug 2023 12:07:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E542082276;
	Wed, 30 Aug 2023 12:07:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E542082276
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 17F431BF487
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 12:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F277241749
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 12:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F277241749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AYnLcDwen2w for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 12:06:55 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCAA4405F5
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCAA4405F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id C755960006;
 Wed, 30 Aug 2023 12:06:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbJyF-0004GO-1P; Wed, 30 Aug 2023 14:06:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20230727162340.3303969-1-bernd@kuhls.net>
 <87edjkre3b.fsf@48ers.dk> <878r9svjvn.fsf@tarshish>
Date: Wed, 30 Aug 2023 14:06:51 +0200
In-Reply-To: <878r9svjvn.fsf@tarshish> (Baruch Siach's message of "Wed, 30 Aug
 2023 14:39:06 +0300")
Message-ID: <87fs40pwdg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.7.14
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Wed, Aug 30 2023, Peter Korsgaard wrote:

 >>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
 >> 
 >> > Changelog:
 >> > https://gitlab.torproject.org/tpo/core/tor/-/blob/release-0.4.7/ChangeLog
 >> 
 >> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> 
 >> Committed to 2023.02.x and 2023.05.x, thanks.

 > This patch is not in the 2023.05.x branch as of commit 69e694d0dd.

Ups, fixed now - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
