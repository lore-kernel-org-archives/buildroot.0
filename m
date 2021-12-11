Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C264FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 14:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C11F85776;
	Sat, 11 Dec 2021 14:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6XZEcrC4IQ1E; Sat, 11 Dec 2021 14:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D4085773;
	Sat, 11 Dec 2021 14:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C65EA1BF584
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 14:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB138576F
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0f9RNCWj2HXW for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 14:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80BC38576E
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 14:57:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 845A124000A;
 Sat, 11 Dec 2021 14:57:21 +0000 (UTC)
Date: Sat, 11 Dec 2021 15:57:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: <Eugen.Hristev@microchip.com>
Message-ID: <20211211155720.1a748c8e@windsurf>
In-Reply-To: <6f7a0f33-05f5-e4ef-a92f-f4b7c08c51ca@microchip.com>
References: <20211104152329.1560933-1-eugen.hristev@microchip.com>
 <6f7a0f33-05f5-e4ef-a92f-f4b7c08c51ca@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/microchip_sama7g5ek: add new
 defconfigs
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

Hello Eugen,

On Mon, 6 Dec 2021 07:45:33 +0000
<Eugen.Hristev@microchip.com> wrote:

> Will this go into -next as well?
> We plan to move to the 2022.02 LTS next year and it would be a big 
> milestone for us to have this board for the next buildroot major LTS.

We can make sure to merge these defconfigs for 2022.02 LTS indeed,
there's still enough time for that.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
