Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384A4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA358402D0;
	Thu, 30 Dec 2021 20:27:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxwpVCQGJRo5; Thu, 30 Dec 2021 20:27:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1462B405C2;
	Thu, 30 Dec 2021 20:27:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB4481BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2B9760BCB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VhbBtDnaCpyj for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:27:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3ED41606ED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:27:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id C9493100002;
 Thu, 30 Dec 2021 20:27:43 +0000 (UTC)
Date: Thu, 30 Dec 2021 21:27:42 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20211230212742.030be8c5@windsurf>
In-Reply-To: <20211026071728.954356-6-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien,

On Tue, 26 Oct 2021 16:17:23 +0900
Damien Le Moal <damien.lemoal@wdc.com> wrote:

> Add two configuration files to support the dual-core RV64 Canaan K210
> SoC based Sipeed MAIX-bit board.

You had lots of feedback from Peter Korsgaard on your Buildroot
defconfigs. Do you think you will have the chance to post an updated
version? I will mark patches 5/10 to 10/10 as Superseded. This means
that if you don't get back to us with an updated version, we will
forget about those patches.

Just two additional notes:

 - The readme files should be readme.txt (not README.md), as we don't
   use markdown for now in our readme files.

 - The readme.txt file for each defconfig should be added in the patch
   adding the defconfig

 - The DEVELOPERS file should be updated, in each patch, to add a
   reference to you as a maintainer for these defconfigs and board/
   files.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
