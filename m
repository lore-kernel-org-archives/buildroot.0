Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71164C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 09:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14719403FC;
	Sun,  9 Jan 2022 09:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6efrscu3HXnx; Sun,  9 Jan 2022 09:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49B0340173;
	Sun,  9 Jan 2022 09:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA8BC1BF3AD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A500E40173
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRycdw3FcwAq for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 09:02:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 681374010E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 09:02:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 68D1760004;
 Sun,  9 Jan 2022 09:02:10 +0000 (UTC)
Date: Sun, 9 Jan 2022 10:02:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Message-ID: <20220109100208.2a1d351d@windsurf>
In-Reply-To: <20210106205206.433749-1-zgyarmati@zgyarmati.de>
References: <20210106205206.433749-1-zgyarmati@zgyarmati.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/simple-mail: new package
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

On Wed,  6 Jan 2021 21:52:06 +0100
Zoltan Gyarmati <zgyarmati@zgyarmati.de> wrote:

> Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/simple-mail/Config.in        |  9 +++++++++
>  package/simple-mail/simple-mail.hash |  5 +++++
>  package/simple-mail/simple-mail.mk   | 14 ++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/simple-mail/Config.in
>  create mode 100644 package/simple-mail/simple-mail.hash
>  create mode 100644 package/simple-mail/simple-mail.mk

After almost one year, patch is applied! I bumped to the latest
version, 2.3.0, and had to disable the demos because some of them need
QtWidgets, which this package doesn't require.

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
