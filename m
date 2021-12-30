Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91734C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C31D41523;
	Thu, 30 Dec 2021 15:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElPG_PP68NSA; Thu, 30 Dec 2021 15:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7D4414A2;
	Thu, 30 Dec 2021 15:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 047581BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E382740550
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Zc0hRiSgJk5 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:20:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F15040530
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:20:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 165A840002;
 Thu, 30 Dec 2021 15:20:19 +0000 (UTC)
Date: Thu, 30 Dec 2021 16:20:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20211230162019.1eba8269@windsurf>
In-Reply-To: <20211229155211.122190-1-ashcharles@gmail.com>
References: <20211229155211.122190-1-ashcharles@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] pru-software-support: bump to latest
 version 6.0.1
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

On Wed, 29 Dec 2021 10:52:11 -0500
Ash Charles <ashcharles@gmail.com> wrote:

> Update to that latest version of the PRU software support [1]. Since
> v5.9.0, the examples have been updated, kernel header references have
> been bumped to v5.10, and some minor bug fixes added.
> 
> [1]
> https://git.ti.com/cgit/pru-softward-support-package/pru-software-support-package
> 
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  package/pru-software-support/pru-software-support.hash | 2 +-
>  package/pru-software-support/pru-software-support.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
