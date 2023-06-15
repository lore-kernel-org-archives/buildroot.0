Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36132EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0F644170A;
	Thu, 15 Jun 2023 06:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0F644170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cacY8QcUr6za; Thu, 15 Jun 2023 06:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAB7641730;
	Thu, 15 Jun 2023 06:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAB7641730
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 647511BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4937341F0A
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4937341F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0P1JMNwRg5p for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:46:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 487C941EFA
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 487C941EFA
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:46:11 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21A722000A;
 Thu, 15 Jun 2023 06:46:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9gkB-00A6WT-6i; Thu, 15 Jun 2023 08:46:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Grzegorz Blach <grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-2-grzegorz@blach.pl>
Date: Thu, 15 Jun 2023 08:46:07 +0200
In-Reply-To: <20230611233619.128038-2-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Mon, 12 Jun 2023 01:36:15 +0200")
Message-ID: <87h6r9mde8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/6] package/graphicsmagick: bump to version
 1.3.40
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

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

The changelog mentions security fixes in 1.3.39 and 1.3.40, so I've
adjusted the commit message to mention that this is a security bump
extended with the details from the changelog and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
