Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326ECC05052
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 12:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA1561060;
	Mon, 14 Aug 2023 12:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCA1561060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2z4WRpyqOro; Mon, 14 Aug 2023 12:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 785F96105B;
	Mon, 14 Aug 2023 12:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 785F96105B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD45A1BF39C
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 12:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8100841728
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 12:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8100841728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dXOpWHdympBa for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 12:12:54 +0000 (UTC)
Received: from iodev.co.uk (iodev.co.uk [46.30.189.100])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC9E741749
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 12:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC9E741749
Received: from pirotess (80.red-83-50-209.dynamicip.rima-tde.net
 [83.50.209.80]) by iodev.co.uk (Postfix) with ESMTPSA id 23AE2208910;
 Mon, 14 Aug 2023 14:12:52 +0200 (CEST)
Date: Mon, 14 Aug 2023 14:12:50 +0200
From: Ismael Luceno <ismael@iodev.co.uk>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZNoaQtXsbAUG8azX@pirotess>
References: <20230814113637.28134-1-ismael@iodev.co.uk>
 <20230814115917.GD421096@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814115917.GD421096@scaer>
X-Spam: Yes
Subject: Re: [Buildroot] [PATCH] package/pounce: New package
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

On 14/Aug/2023 13:59, Yann E. MORIN wrote:
<...> 
> You did not take into account a single one of the comments I made in
> my previous review:
<...>

Ah, sorry, I sent it again by accident.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
