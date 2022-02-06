Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCECC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2018A4026F;
	Sun,  6 Feb 2022 14:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETLPbtM6ryer; Sun,  6 Feb 2022 14:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12DB1400C1;
	Sun,  6 Feb 2022 14:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA301BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09BBD400C1
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eG9-of-1Uj0M for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:24:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A237C400A8
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:24:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0781420002;
 Sun,  6 Feb 2022 14:24:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nGiT0-00011n-5E; Sun, 06 Feb 2022 15:24:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: yegorslists--- via buildroot <buildroot@buildroot.org>
References: <20220130105116.18458-1-yegorslists@googlemail.com>
Date: Sun, 06 Feb 2022 15:24:38 +0100
In-Reply-To: <20220130105116.18458-1-yegorslists@googlemail.com>
 (yegorslists's message of "Sun, 30 Jan 2022 11:51:16 +0100")
Message-ID: <87leyovzrt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add entry for hostapd and
 wpa_supplicant to Yegor Yefremov
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "yegorslists---" == yegorslists--- via buildroot <buildroot@buildroot.org> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
