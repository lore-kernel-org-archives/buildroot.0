Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F48EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6217832EB;
	Wed, 14 Jun 2023 11:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6217832EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C93pBN3afhFY; Wed, 14 Jun 2023 11:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC9F8204D;
	Wed, 14 Jun 2023 11:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC9F8204D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 363161BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0EBFF6123E
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EBFF6123E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HCWhGiRSe21X for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:47:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16E2861238
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16E2861238
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:47:52 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09BEBFF809;
 Wed, 14 Jun 2023 11:47:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Oyc-005pzY-Dz; Wed, 14 Jun 2023 13:47:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20230603105509.581631-1-bernd.kuhls@t-online.de>
Date: Wed, 14 Jun 2023 13:47:50 +0200
In-Reply-To: <20230603105509.581631-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 3 Jun 2023 12:55:09 +0200")
Message-ID: <87mt12qn89.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/1] package/minidlna: bump version to
 1.3.3
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://sourceforge.net/p/minidlna/git/ci/master/tree/NEWS

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
