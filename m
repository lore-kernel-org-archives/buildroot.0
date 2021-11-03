Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6719EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:50:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C86C6112E
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C86C6112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5EA481762;
	Wed,  3 Nov 2021 21:50:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9T-_-fQ0Me8; Wed,  3 Nov 2021 21:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 307F281768;
	Wed,  3 Nov 2021 21:50:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF6291BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCACB8175F
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id liw-LnX7fknl for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:50:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1FB18175E
 for <buildroot@busybox.net>; Wed,  3 Nov 2021 21:50:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DDEA1E0007;
 Wed,  3 Nov 2021 21:50:31 +0000 (UTC)
Date: Wed, 3 Nov 2021 22:50:30 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20211103225030.38ba3050@windsurf>
In-Reply-To: <20211101101217.23328-1-mf@go-sys.de>
References: <20211101101217.23328-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: bump version to 1.34.1
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
Cc: buildroot@busybox.net, Denys Vlasenko <vda.linux@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 1 Nov 2021 11:12:17 +0100
Michael Fischer <mf@go-sys.de> wrote:

> patch 0003: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...003-udhcp-fix-build-breakage-on-MIPS.patch | 39 -------------------
>  package/busybox/busybox.hash                  |  4 +-
>  package/busybox/busybox.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 package/busybox/0003-udhcp-fix-build-breakage-on-MIPS.patch

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
