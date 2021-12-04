Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF5FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601E680DC5;
	Sat,  4 Dec 2021 22:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apXjsclWG_wO; Sat,  4 Dec 2021 22:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC4780CD0;
	Sat,  4 Dec 2021 22:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5520B1BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51E38404A7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDtBXsOPRX8m for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:13:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63DA8401B3
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:13:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 84D7760007;
 Sat,  4 Dec 2021 22:13:36 +0000 (UTC)
Date: Sat, 4 Dec 2021 23:13:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211204231335.5f223553@windsurf>
In-Reply-To: <20211122020804.535891-2-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
 <20211122020804.535891-2-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/inadyn: bump to version 2.9.0
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

On Mon, 22 Nov 2021 03:08:00 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Upstream changing to .tar.gz, prepare by dropping INADYN_SOURCE,
> as suggested by utils/check-package.
> 
> See the ChangeLog, or release notes at GitHub, for full details:
> https://github.com/troglobit/inadyn/releases/tag/v2.9.0
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/inadyn/inadyn.hash | 4 ++--
>  package/inadyn/inadyn.mk   | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)

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
