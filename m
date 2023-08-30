Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1531C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7616941B60;
	Wed, 30 Aug 2023 10:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7616941B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utcEpXcf55g8; Wed, 30 Aug 2023 10:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8892D41602;
	Wed, 30 Aug 2023 10:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8892D41602
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB1941BF2B1
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E95D41762
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 10:31:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E95D41762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p7URS8O1dJiD for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 10:31:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 902F6418A1
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 10:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 902F6418A1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7BB1BFF80D;
 Wed, 30 Aug 2023 10:31:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbIUB-0002AE-K5; Wed, 30 Aug 2023 12:31:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Bobrenok via buildroot <buildroot@buildroot.org>
References: <20230618111434.62274-1-SIBobrenok@sberdevices.ru>
 <20230618111434.62274-2-SIBobrenok@sberdevices.ru>
Date: Wed, 30 Aug 2023 12:31:43 +0200
In-Reply-To: <20230618111434.62274-2-SIBobrenok@sberdevices.ru> (Sergey
 Bobrenok via buildroot's message of "Sun, 18 Jun 2023 14:14:34 +0300")
Message-ID: <874jkgstww.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/crudini: add host variant
 dependency from python-iniparse
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
