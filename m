Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1DDC46CCD
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 10:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B63A581E44;
	Wed, 20 Dec 2023 10:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B63A581E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R4IpEu692yKe; Wed, 20 Dec 2023 10:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20EF581BB2;
	Wed, 20 Dec 2023 10:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20EF581BB2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1203F1BF2B3
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC20041B8C
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 10:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC20041B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dLlBgW0lHAA5 for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 10:49:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2993541BA2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 10:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2993541BA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11454240004;
 Wed, 20 Dec 2023 10:49:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rFu8u-00HToF-0s;
 Wed, 20 Dec 2023 11:49:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20231219231324.936423-1-giulio.benetti@benettiengineering.com>
Date: Wed, 20 Dec 2023 11:49:36 +0100
In-Reply-To: <20231219231324.936423-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 20 Dec 2023 00:13:24 +0100")
Message-ID: <875y0t87y7.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libnss: bump to version 3.96.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
