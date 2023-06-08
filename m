Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E82C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 20:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 435044154A;
	Thu,  8 Jun 2023 20:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 435044154A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FEg_V54Tyx_d; Thu,  8 Jun 2023 20:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E2DA41561;
	Thu,  8 Jun 2023 20:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2DA41561
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 680401BF395
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34AC14155C
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34AC14155C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXzCRrSTeOJu for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 20:39:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E59524154A
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E59524154A
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 20:39:53 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EED4E1BF203;
 Thu,  8 Jun 2023 20:39:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q7MQA-0008Ww-03; Thu, 08 Jun 2023 22:39:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: James Knight <james.d.knight@live.com>
References: <20230507213433.4128-1-james.d.knight@live.com>
 <SN4P221MB0682AD37886082711DF0E5EAA0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Date: Thu, 08 Jun 2023 22:39:49 +0200
In-Reply-To: <SN4P221MB0682AD37886082711DF0E5EAA0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 (James Knight's message of "Sun, 7 May 2023 17:34:31 -0400")
Message-ID: <87edml3cyy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/5] package/rpm: bump to version 4.18.1
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

 > The most recent release of RPM is v4.18.1 [1].
 > Adding an upstream patch to prevent build failures for certain
 > toolchains (0001-fix-var-declare-in-label-error.patch). Fix should be
 > available next release.

 > [1]: https://rpm.org/wiki/Releases/4.18.1

 > Signed-off-by: James Knight <james.d.knight@live.com>
 > ---
 > Changes v1 -> v2:
 >   - New patch in v2, with changes from the original first patch.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
