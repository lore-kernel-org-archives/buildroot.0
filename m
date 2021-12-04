Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1FAC43217
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A12A40400;
	Sat,  4 Dec 2021 21:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pb5NNTm_9OIy; Sat,  4 Dec 2021 21:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB40D40372;
	Sat,  4 Dec 2021 21:58:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9321BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47A9A40260
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qriaZbqzOWyC for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:57:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F114D401AF
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:57:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id B3339200005;
 Sat,  4 Dec 2021 21:57:42 +0000 (UTC)
Date: Sat, 4 Dec 2021 22:57:41 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20211204225741.48a38e26@windsurf>
In-Reply-To: <20211125125558.1087094-2-heiko.thiery@gmail.com>
References: <20211125125558.1087094-1-heiko.thiery@gmail.com>
 <20211125125558.1087094-2-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] package/libyang: bump verstion to
 2.0.112
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
Cc: Jan =?UTF-8?B?S3VuZHLDoXQ=?= <jan.kundrat@cesnet.cz>,
 Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Nov 2021 13:55:57 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/libyang/Config.in    | 3 +--
>  package/libyang/libyang.hash | 4 ++--
>  package/libyang/libyang.mk   | 6 +++---
>  3 files changed, 6 insertions(+), 7 deletions(-)

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
