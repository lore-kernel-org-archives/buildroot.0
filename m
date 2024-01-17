Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FFFC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 12:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2954543625;
	Wed, 17 Jan 2024 12:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2954543625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17MdwhHFDRvd; Wed, 17 Jan 2024 12:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43C9D43611;
	Wed, 17 Jan 2024 12:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43C9D43611
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5531BF95D
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0826E41F2E
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 12:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0826E41F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqzJPsBXN58t for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 12:51:26 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1816941F2B
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 12:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1816941F2B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67185FF803;
 Wed, 17 Jan 2024 12:51:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rQ5O5-00FtTv-1h;
 Wed, 17 Jan 2024 13:51:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Petr Vorel <petr.vorel@gmail.com>
References: <20240115214137.2350453-1-petr.vorel@gmail.com>
 <20240115214137.2350453-2-petr.vorel@gmail.com>
Date: Wed, 17 Jan 2024 13:51:21 +0100
In-Reply-To: <20240115214137.2350453-2-petr.vorel@gmail.com> (Petr Vorel's
 message of "Mon, 15 Jan 2024 22:41:35 +0100")
Message-ID: <87ply0i0mu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/3] linux: bump latest version to 6.6
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Angelo Compagnucci <angelo@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 >  linux/Config.in | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 9f9cf55d96..aa6f846338 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -28,8 +28,8 @@ choice
 >  	prompt "Kernel version"
 
 >  config BR2_LINUX_KERNEL_LATEST_VERSION
 > -	bool "Latest version (6.6)"
 > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6 if BR2_KERNEL_HEADERS_AS_KERNEL
 > +	bool "Latest version (6.7)"
 > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_7 if BR2_KERNEL_HEADERS_AS_KERNEL

Your commit message says 6.6 but this is about 6.7? Given that 6.6 is a
LTS kernel I would prefer to default to that for the upcoming 2024.02
release.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
