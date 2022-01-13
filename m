Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB16C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ECCE40650;
	Thu, 13 Jan 2022 21:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Lwtq1K5Wc5f; Thu, 13 Jan 2022 21:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F382D40544;
	Thu, 13 Jan 2022 21:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 030BE1BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E135040544
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Srrqbe1Suct0 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:10:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB721403ED
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:10:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1BC87C0004;
 Thu, 13 Jan 2022 21:10:46 +0000 (UTC)
Date: Thu, 13 Jan 2022 22:10:45 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Message-ID: <20220113221045.0a09cfc1@windsurf>
In-Reply-To: <20211217233227.16411-1-kuzminov.sergey81@gmail.com>
References: <20211217233227.16411-1-kuzminov.sergey81@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] board/orangepi/orangepi-zero:using UUID to
 root
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

On Sat, 18 Dec 2021 02:32:27 +0300
Sergey Kuzminov <kuzminov.sergey81@gmail.com> wrote:

> The mmc block device number can vary. Passing a mmc block device to specify the location of the rootfs is not a reliable approach.
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> ---
>  board/orangepi/orangepi-zero/boot.cmd | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
