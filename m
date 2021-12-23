Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE16C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 17:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3DE6832AA;
	Thu, 23 Dec 2021 17:39:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFiTwjiwKAFv; Thu, 23 Dec 2021 17:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 591AB832B0;
	Thu, 23 Dec 2021 17:39:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDA1A1BF2E5
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C69F340ACD
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 17:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HsIz0uMR43Xp for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 17:38:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4425940AAB
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 17:38:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2EFFB60007;
 Thu, 23 Dec 2021 17:38:34 +0000 (UTC)
Date: Thu, 23 Dec 2021 18:38:33 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20211223183833.3d4ce644@windsurf>
In-Reply-To: <20211222231825.798177-1-aperez@igalia.com>
References: <20211222231825.798177-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.34.3
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

On Thu, 23 Dec 2021 01:18:25 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a minor release which provides fixes for CVE-2021-30887
> and CVE-2021-30890. Full release notes can be found at:
> 
>   https://wpewebkit.org/release/wpewebkit-2.34.3.html
> 
> An accompanying security advisory has been published at:
> 
>   https://wpewebkit.org/security/WSA-2021-0007.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
