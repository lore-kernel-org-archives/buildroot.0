Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A424C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19068403AC;
	Tue, 28 Dec 2021 21:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKyTMykuBrjN; Tue, 28 Dec 2021 21:05:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 463BE4023F;
	Tue, 28 Dec 2021 21:05:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 343741BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31142401CD
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:05:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kn91p5GJPhks for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:05:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1451A40193
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:05:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id BFBCD240003;
 Tue, 28 Dec 2021 21:05:47 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:05:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: chenxy <field.xue@gmail.com>
Message-ID: <20211228220546.231d7fee@windsurf>
In-Reply-To: <20211102141848.364177-1-field.xue@gmail.com>
References: <20211102141848.364177-1-field.xue@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] feat: add siitool package
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

Hello fieldxy,

On Tue,  2 Nov 2021 22:18:47 +0800
chenxy <field.xue@gmail.com> wrote:

> From: fieldxy <field.xue@gmail.com>
> 
> - Siitool generates your SII/EEPROM files from the ESI/XML description files of
>   your EtherCAT devices. The program is also capable of interpreting a raw SII/EEPROM
>   file and print it in a human-friendly syntax.
> - git web https://github.com/synapticon/siitool

Thanks for your patch. But unfortunately, as it is, we can't apply it
as we don't accept anonymous contributions. Could you resubmit with
your full name?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
