Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA26C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75B5E82D14;
	Wed,  1 Jun 2022 16:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJTYPH2-Zzrs; Wed,  1 Jun 2022 16:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9259982560;
	Wed,  1 Jun 2022 16:14:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC8101BF573
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC27A82560
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSoMqbZW_dnk for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:14:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDD3E81D19
 for <buildroot@busybox.net>; Wed,  1 Jun 2022 16:14:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 83C7620008;
 Wed,  1 Jun 2022 16:14:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nwQz7-008ta6-80; Wed, 01 Jun 2022 18:14:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <dd41c88b74f3fdf0e67996c5fc999af7a4122c91.1652862360.git.baruch@tkos.co.il>
Date: Wed, 01 Jun 2022 18:14:13 +0200
In-Reply-To: <dd41c88b74f3fdf0e67996c5fc999af7a4122c91.1652862360.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Wed, 18 May 2022 11:26:00
 +0300")
Message-ID: <87fsko2wfe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libnftnl: remove json support
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > JSON support and the jansson dependency have been removed in version
 > 1.1.2.

 > Cc: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
