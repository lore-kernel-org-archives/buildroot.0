Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6738AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 22:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E14C0404BD;
	Thu,  6 Jan 2022 22:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YWeK9LCMuB7H; Thu,  6 Jan 2022 22:29:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B06B40131;
	Thu,  6 Jan 2022 22:29:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BBADA1BF378
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70D083367
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 22:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGPhiomIp2Di for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 22:29:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B10E182ACD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 22:29:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id C54BBE0005;
 Thu,  6 Jan 2022 22:29:50 +0000 (UTC)
Date: Thu, 6 Jan 2022 23:29:49 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220106232949.636ec1ba@windsurf>
In-Reply-To: <CA+h8R2rb6kXYQmgN-BhYXVnxZHmdSC7DXEP-YeBj7THS2A=iYg@mail.gmail.com>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <CA+h8R2rb6kXYQmgN-BhYXVnxZHmdSC7DXEP-YeBj7THS2A=iYg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 00/11] Support for Cargo and Go vendoring
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Buildroot List <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 6 Jan 2022 14:26:13 -0800
Christian Stewart <christian@paral.in> wrote:

> It'd be nice if the author on these commits could be edited to remove
> the "via buildroot"
> 
> ... this was added by a Patchwork bug a while back.

ACK, will fix!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
