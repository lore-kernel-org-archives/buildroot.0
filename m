Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475ACC6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA8A141894;
	Wed, 15 Mar 2023 14:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA8A141894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLHGp_lYQZpK; Wed, 15 Mar 2023 14:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1BBF41876;
	Wed, 15 Mar 2023 14:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1BBF41876
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E376B1BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD8F180BEA
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD8F180BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfRYSa5hGX7X for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:41:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE44F80B52
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE44F80B52
 for <buildroot@buildroot.net>; Wed, 15 Mar 2023 14:41:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 541851BF212;
 Wed, 15 Mar 2023 14:41:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcSK5-0029Wb-Fo; Wed, 15 Mar 2023 15:41:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
References: <ZABq61t3vEixCwpm@einstein.dilieto.eu>
Date: Wed, 15 Mar 2023 15:41:49 +0100
In-Reply-To: <ZABq61t3vEixCwpm@einstein.dilieto.eu> (Nicola Di Lieto's message
 of "Thu, 2 Mar 2023 10:22:51 +0100")
Message-ID: <87ttym13gy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/uacme: bump version to 1.7.4
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
Cc: buildroot@buildroot.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicola" == Nicola Di Lieto <nicola.dilieto@gmail.com> writes:

 > Includes https://github.com/ndilieto/uacme/commit/fe91f46b620f8c58805fcf48cb4f4a793c8a47a4
 > Fixes https://github.com/ndilieto/uacme/issues/64

 > Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
 > ---
 > Changes v1 -> v2: fix patch whitespace damage by email client

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
