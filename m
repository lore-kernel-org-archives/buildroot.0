Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378C8C433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 17:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B9E41D83;
	Wed, 30 Mar 2022 17:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oZCzutT5UFte; Wed, 30 Mar 2022 17:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D91941D1C;
	Wed, 30 Mar 2022 17:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1F741BF47E
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0B57848D2
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 17:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0EB9fJ4QuLF for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 17:21:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AE36848DC
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 17:21:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6E52660005;
 Wed, 30 Mar 2022 17:21:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZc0E-0006ZF-Gx; Wed, 30 Mar 2022 19:21:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Peter Seiderer <ps.report@gmx.net>
References: <20220318082446.18552-1-ps.report@gmx.net>
Date: Wed, 30 Mar 2022 19:21:02 +0200
In-Reply-To: <20220318082446.18552-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 18 Mar 2022 09:24:45 +0100")
Message-ID: <87sfqz73wh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/spidev_test: fix
 spidev_test.c version in Config.in help text
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

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - fix spidev_test.c version in Config.in help text, version update to 4.10
 >   (missing from commit 'spidev_test: bump to version in Linux 4.10' [1])

 > [1] https://git.buildroot.net/buildroot/commit/?id=a497a9fd6cdb518572282b1478279f476f870fb7

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
