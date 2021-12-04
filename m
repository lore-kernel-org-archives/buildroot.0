Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACD2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 20:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35BE83126;
	Sat,  4 Dec 2021 20:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GvIRzjeVrPTp; Sat,  4 Dec 2021 20:49:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226AF82F57;
	Sat,  4 Dec 2021 20:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE061BF473
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6BF405D0
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 20:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R9LQdvv6Sjdk for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 20:49:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41B49405CA
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 20:49:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 89DE2240007;
 Sat,  4 Dec 2021 20:49:26 +0000 (UTC)
Date: Sat, 4 Dec 2021 21:49:25 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20211204214925.4609145b@windsurf>
In-Reply-To: <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
References: <20211202013902.1593562-1-troglobit@gmail.com>
 <20211202013902.1593562-2-troglobit@gmail.com>
 <20211204210459.461e4f39@windsurf>
 <0f7d1dfe-07c3-198f-3449-9179db0e385c@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next 1/2] package/watchdogd: bump to version
 3.5
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
Cc: Alejandro =?UTF-8?B?R29uesOhbGV6?= <alejandro.gonzalez.correo@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 4 Dec 2021 21:23:23 +0100
Joachim Wiberg <troglobit@gmail.com> wrote:

> Very unfortunate name clash between include files in two packages.

Yes, I had followed this.

> http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6
> 
> However, I think it's highly unlikely they'll be enabled at the same
> time. My recommendation is to go for next and let 2021.11 out the door.

But if the build issue exists in master, we need to fix it in master,
or the issue will keep popping up again and again in the autobuilders.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
