Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CA7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491C480C53;
	Tue, 28 Dec 2021 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MXC8ezxE6mB4; Tue, 28 Dec 2021 21:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E1480CDE;
	Tue, 28 Dec 2021 21:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20C421BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DEDF40253
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGQ9w8pRlxzL for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:11:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5844400BA
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:11:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 994D5FF80C;
 Tue, 28 Dec 2021 21:11:14 +0000 (UTC)
Date: Tue, 28 Dec 2021 22:11:13 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Vyacheslav Bocharov via buildroot <buildroot@buildroot.org>
Message-ID: <20211228221113.7d89f7ad@windsurf>
In-Reply-To: <20211028170800.3880491-1-adeep@lexina.in>
References: <20211028170800.3880491-1-adeep@lexina.in>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/armbian-firmware: bump to commit
 5d685ad233b4dfd03a4d025fa0061f6b0f850cb3
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
Cc: Vyacheslav Bocharov <adeep@lexina.in>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Oct 2021 20:08:02 +0300
Vyacheslav Bocharov via buildroot <buildroot@buildroot.org> wrote:

> Update package/armbian-firmware to latest commit.
> Update files for Realtek 8822CS WiFi/BT combo chip.
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> 
> ---
>  package/armbian-firmware/armbian-firmware.hash | 2 +-
>  package/armbian-firmware/armbian-firmware.mk   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

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
