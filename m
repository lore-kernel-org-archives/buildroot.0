Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3C7E7849A
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 08:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0D8B40B12;
	Mon,  2 Oct 2023 08:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0D8B40B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 542Dxw54Or0G; Mon,  2 Oct 2023 08:41:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B0E40B03;
	Mon,  2 Oct 2023 08:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9B0E40B03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 500391BF4E3
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2931640B03
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 08:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2931640B03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6TZZj4SIz5M for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 08:41:53 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5A8D40125
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 08:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A8D40125
Received: by mail.gandi.net (Postfix) with ESMTPSA id 187B720009;
 Mon,  2 Oct 2023 08:41:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qnEUt-000VBC-75; Mon, 02 Oct 2023 10:41:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20231001190101.2640495-1-giulio.benetti@benettiengineering.com>
Date: Mon, 02 Oct 2023 10:41:47 +0200
In-Reply-To: <20231001190101.2640495-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Sun, 1 Oct 2023 21:01:01 +0200")
Message-ID: <87y1glh0vo.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/wilc-driver: fix build failure
 with Linux 6.3+
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Add local patches pending upstream to fix build failure on Linux 6.3+
 > Fixes:
 > http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
