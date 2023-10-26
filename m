Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A092C25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5BB042DD9;
	Thu, 26 Oct 2023 16:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5BB042DD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2NMedfU-ukL; Thu, 26 Oct 2023 16:33:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E13742DD6;
	Thu, 26 Oct 2023 16:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E13742DD6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2792A1BF239
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BF342DD6
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BF342DD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CF2Hyz72zuMR for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:33:22 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE71F42DCD
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE71F42DCD
Received: by mail.gandi.net (Postfix) with ESMTPSA id B143560007;
 Thu, 26 Oct 2023 16:33:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qw3IM-006yFi-T3; Thu, 26 Oct 2023 18:33:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20231015063648.1360322-1-troglobit@gmail.com>
Date: Thu, 26 Oct 2023 18:33:18 +0200
In-Reply-To: <20231015063648.1360322-1-troglobit@gmail.com> (Joachim Wiberg's
 message of "Sun, 15 Oct 2023 08:36:46 +0200")
Message-ID: <875y2tny29.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/inadyn: bump to v2.12.0
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

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > New features and DDNS provider support (IPv64.net), but also a lot of
 > fixes to regressions introduced in v2.11.0, e.g.:

 >  - dynv6.com not working at all, regression in v2.11.0
 >  - Regression in DDNS provider names, introduced in v2.11.0:
 >    - dyndns@3322.org
 >    - dyndns@he.net
 >    - default@dynv6.com
 >    - ipv6tb@he.net

 > From https://github.com/troglobit/inadyn/releases/tag/v2.12.0

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Committed to 2023.08.x given the regression fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
