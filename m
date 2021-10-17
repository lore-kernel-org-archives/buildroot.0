Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0E6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14C0760EBD
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 09:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14C0760EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F6B402B8;
	Sun, 17 Oct 2021 09:11:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GKO4ZdrxYglj; Sun, 17 Oct 2021 09:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00808401B7;
	Sun, 17 Oct 2021 09:11:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9341BF3CD
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A1BC401B7
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 09:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C9BqLO7-26Z6 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 09:10:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB99E400BD
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 09:10:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6EE8720002;
 Sun, 17 Oct 2021 09:10:52 +0000 (UTC)
Date: Sun, 17 Oct 2021 11:10:51 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211017111051.750d0d24@windsurf>
In-Reply-To: <20211012203136.16834-1-bernd.kuhls@t-online.de>
References: <20211012203136.16834-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/libva: bump version to 2.13.0
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Oct 2021 22:31:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes: https://github.com/intel/libva/releases/tag/2.13.0
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva/libva.hash | 6 +++---
>  package/libva/libva.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
