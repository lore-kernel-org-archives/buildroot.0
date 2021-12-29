Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB02AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 976CB40022;
	Wed, 29 Dec 2021 09:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1NRVL_Ctznk2; Wed, 29 Dec 2021 09:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8401400C7;
	Wed, 29 Dec 2021 09:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 865F41BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 742B2400C7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L12XD_Pt9aSO for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AE8940022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:00:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2A2911C0009;
 Wed, 29 Dec 2021 09:00:24 +0000 (UTC)
Date: Wed, 29 Dec 2021 10:00:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20211229100023.5e672b23@windsurf>
In-Reply-To: <3e2a86be-e5d5-a4e4-1be8-e263c20b0a5f@green-communications.fr>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <20210928195533.1736944-2-mmayer@broadcom.com>
 <20211228221804.6b965558@windsurf>
 <3e2a86be-e5d5-a4e4-1be8-e263c20b0a5f@green-communications.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: set HOST*_NOCCACHE variables
 only if unset
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
Cc: Markus Mayer <mmayer@broadcom.com>,
 Markus Mayer via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Dec 2021 22:26:35 +0100
Nicolas Cavallari <nicolas.cavallari@green-communications.fr> wrote:

> The cover text mentions it: calling make legal-info inside a post-build 
> script (or package, actually) to somehow include the result in the image.

Many thanks for pointing it out, because the cover letter obviously
contains all the details.

I am looking at patches through patchwork, so I tend to only see the
patches themselves and not necessarily an associated cover letter.
Especially for single patches, where a cover letter is rarely present,
and therefore I rarely tend to search for such a cover letter in the
mailing list.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
