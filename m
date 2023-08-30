Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC02C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 10:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F03A418C8;
	Wed, 30 Aug 2023 10:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F03A418C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26a8Ml_2mbeC; Wed, 30 Aug 2023 10:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BFB941762;
	Wed, 30 Aug 2023 10:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BFB941762
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEC951BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9432682279
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9432682279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAtxktGlhFTn for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 10:31:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689E482276
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 10:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689E482276
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9A7140004;
 Wed, 30 Aug 2023 10:31:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbIU7-0002A8-R6; Wed, 30 Aug 2023 12:31:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
References: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
Date: Wed, 30 Aug 2023 12:31:39 +0200
In-Reply-To: <20230618111434.62274-1-SIBobrenok@sberdevices.ru> (Sergey
 Bobrenok via buildroot's message of "Sun, 18 Jun 2023 14:14:33 +0300")
Message-ID: <878r9sstx0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/python-iniparse: add host
 variant dependency from python-six
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Sergey Bobrenok <SIBobrenok@sberdevices.ru>, Asaf Kahlon <asafka7@gmail.com>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sergey" == Sergey Bobrenok via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Sergey Bobrenok <SIBobrenok@sberdevices.ru>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
