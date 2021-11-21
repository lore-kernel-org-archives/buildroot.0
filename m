Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BACC433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 091B4403D8;
	Sun, 21 Nov 2021 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHdJKXLVB8HS; Sun, 21 Nov 2021 20:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F136E403C4;
	Sun, 21 Nov 2021 20:51:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E296D1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D17DD403AE
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkD16u9ZElL0 for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:50:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABEEF40286
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:50:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B5BFFC0004;
 Sun, 21 Nov 2021 20:50:32 +0000 (UTC)
Date: Sun, 21 Nov 2021 21:50:32 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211121215032.21ea0bfc@windsurf>
In-Reply-To: <20211121090135.3050610-1-troglobit@gmail.com>
References: <20211121090135.3050610-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/smcroute: bump to version 2.5.5
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Nov 2021 10:01:35 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Fixes parse error when calling 'smcrouted -N' with a config file that
> has 'mrdisc' disabled for one or more interfaces.  Multicast router
> discovery (mrdisc) is enabled by default in Buildroot.
> 
> See the ChangeLog, or release notes at GitHub, for more information:
> https://github.com/troglobit/smcroute/releases/tag/2.5.5
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/smcroute/smcroute.hash | 2 +-
>  package/smcroute/smcroute.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
