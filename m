Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF75C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8AC3605BD;
	Tue,  7 May 2024 21:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJVO9CgZHOZ8; Tue,  7 May 2024 21:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F177D60B74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F177D60B74;
	Tue,  7 May 2024 21:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 740151BF36B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 614F4605BD
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 21:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id usSuA-uvqaMQ for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 21:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F118860B74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F118860B74
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F118860B74
 for <buildroot@buildroot.org>; Tue,  7 May 2024 21:08:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CE4640004;
 Tue,  7 May 2024 21:08:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s4S2g-005Hyu-2b;
 Tue, 07 May 2024 23:08:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
 <87msp1wqqo.fsf@dell.be.48ers.dk>
 <CABGWkvq4K64XFUdck+v171DMad+QGzufq_TEWwv51NjE5hrhNg@mail.gmail.com>
 <871q6dwgvw.fsf@dell.be.48ers.dk>
 <CABGWkvrNG00oAH0mL7Qb5BoQ3WpCtbK=ywmJAMNPtJ+msvieHA@mail.gmail.com>
Date: Tue, 07 May 2024 23:08:06 +0200
In-Reply-To: <CABGWkvrNG00oAH0mL7Qb5BoQ3WpCtbK=ywmJAMNPtJ+msvieHA@mail.gmail.com>
 (Dario Binacchi's message of "Tue, 7 May 2024 22:10:28 +0200")
Message-ID: <87v83ptjnt.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/3] package/bmap-tools: update GitHub URL
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
Cc: linux-amarula@amarulasolutions.com, "Yann E .
 Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

Hi,

 > Since this patch is the first in a series of 3, where the final patch
 > bumps the version to 3.8.0, what are your
 > thoughts on the 2024.02.x version?
 > Is there anything I need to do?

No, it is fine. I will just skip the patches for 2024.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
