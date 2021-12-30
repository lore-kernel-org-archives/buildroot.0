Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE3FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38DCF827C6;
	Thu, 30 Dec 2021 16:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2KW806awilI; Thu, 30 Dec 2021 16:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48238276B;
	Thu, 30 Dec 2021 16:37:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF72A1BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCB5340104
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P_NSSsNrlRAB for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:37:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97039400FB
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:37:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 75707240008;
 Thu, 30 Dec 2021 16:37:31 +0000 (UTC)
Date: Thu, 30 Dec 2021 17:37:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: CHEN Xiangyu via buildroot <buildroot@buildroot.org>
Message-ID: <20211230173730.75cb450a@windsurf>
In-Reply-To: <20211025022146.2556-2-xiangyu.chen@aol.com>
References: <[Buildroot] [PATCH] boot/at91bootstrap3: add svn repository
 method> <20211025022146.2556-1-xiangyu.chen@aol.com>
 <20211025022146.2556-2-xiangyu.chen@aol.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] [PATCH v2 1/1] boot/at91bootstrap3: add
 svn repository method
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
Cc: spdawson@gmail.com, CHEN Xiangyu <xiangyu.chen@aol.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 25 Oct 2021 10:21:46 +0800
CHEN Xiangyu via buildroot <buildroot@buildroot.org> wrote:

> Since more and more traditional companies are starting using buildroot
> with AT91SAM9x chipset as their product firmware, much of them are still
> using SVN as their version control system. So add svn repository method
> to AT91bootstrap3 package.
> 
> Signed-off-by: CHEN Xiangyu <xiangyu.chen@aol.com>
> ---
>  boot/at91bootstrap3/Config.in         | 12 +++++++++---
>  boot/at91bootstrap3/at91bootstrap3.mk |  4 ++++
>  2 files changed, 13 insertions(+), 3 deletions(-)

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
