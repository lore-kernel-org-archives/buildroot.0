Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B86C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E0080D7E;
	Thu, 30 Dec 2021 22:36:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0w2AyPtp6mh; Thu, 30 Dec 2021 22:36:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B3980C8C;
	Thu, 30 Dec 2021 22:36:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9A01BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D94660C0F
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6n7Ann_UIDw for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:36:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FD9E60BDE
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:36:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 83C4820000A;
 Thu, 30 Dec 2021 22:36:28 +0000 (UTC)
Date: Thu, 30 Dec 2021 23:36:27 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211230233627.36580091@windsurf>
In-Reply-To: <20211102074707.3457972-2-james.hilliard1@gmail.com>
References: <20211102074707.3457972-1-james.hilliard1@gmail.com>
 <20211102074707.3457972-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/python-aiohttp: bump to version
 3.8.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue,  2 Nov 2021 01:47:07 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> License hash change due to removal of license full text:
> https://github.com/aio-libs/aiohttp/commit/aca2c99f822af1b149c212c6566d8f116d8314d6
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-aiohttp/python-aiohttp.hash | 6 +++---
>  package/python-aiohttp/python-aiohttp.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

I've applied to master. Please note that I had to drop
package/python-aiohttp/0001-Bump-async-timeout-version-for-aiohttp-3.8-5299.patch,
which would no longer apply, as it was a backport from upstream, now in
3.8.0.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
