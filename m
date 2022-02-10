Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3A2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C73D82CE4;
	Thu, 10 Feb 2022 21:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGRLfEwE7bGY; Thu, 10 Feb 2022 21:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7422482C84;
	Thu, 10 Feb 2022 21:21:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6907D1BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581A34093D
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHcPFF5xIw7O for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:21:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E204091E
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:21:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F41F560004;
 Thu, 10 Feb 2022 21:21:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIGsN-00085n-PY; Thu, 10 Feb 2022 22:21:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20220209214326.21671-1-heiko.thiery@gmail.com>
Date: Thu, 10 Feb 2022 22:21:15 +0100
In-Reply-To: <20220209214326.21671-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Wed, 9 Feb 2022 22:43:27 +0100")
Message-ID: <878ruiwh84.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rauc: bump to version 1.6
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
Cc: Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > For release notes see: https://github.com/rauc/rauc/releases/tag/v1.6
 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 > ---

 > # utils/test-pkg -p rauc
 >                     bootlin-armv5-uclibc [1/6]: OK
 >                      bootlin-armv7-glibc [2/6]: OK
 >                    bootlin-armv7m-uclibc [3/6]: SKIPPED
 >                      bootlin-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: OK
 >                             sourcery-arm [6/6]: OK
 > 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed


Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
