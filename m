Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B99C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:10:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C34E60F46
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C34E60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F16B80C80;
	Sun, 24 Oct 2021 13:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mJn4tR-y5pR; Sun, 24 Oct 2021 13:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 862FB80CF8;
	Sun, 24 Oct 2021 13:09:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFEFB1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC6AC607E6
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6VPXBum-3L5N for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:09:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7329605BB
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:09:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4CC601BF203;
 Sun, 24 Oct 2021 13:09:44 +0000 (UTC)
Date: Sun, 24 Oct 2021 15:09:43 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20211024150943.5e8c0ece@windsurf>
In-Reply-To: <20211022091934.534382-1-aperez@igalia.com>
References: <20211022091934.534382-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/seatd: bump to version 0.6.3
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

On Fri, 22 Oct 2021 12:19:34 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update seatd to version 0.6.3, which fixes a crash when used along
> libinput 1.19.
> 
> Release notes:
> 
>   https://git.sr.ht/~kennylevinsen/seatd/refs/0.6.3
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/seatd/seatd.hash | 2 +-
>  package/seatd/seatd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
