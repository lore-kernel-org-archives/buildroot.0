Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1496BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:11:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5FBB61104
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5FBB61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B198E80E62;
	Sun, 14 Nov 2021 14:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lnz9X-lVtuS4; Sun, 14 Nov 2021 14:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A5F80E64;
	Sun, 14 Nov 2021 14:11:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C24C11BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1EEB40347
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLxfZdo9kUgw for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:10:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D21FF40346
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:10:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 19BC324000D;
 Sun, 14 Nov 2021 14:10:20 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:10:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211114151020.34f4b380@windsurf>
In-Reply-To: <20211108222902.29000-1-ps.report@gmx.net>
References: <20211108222902.29000-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] package/ell: bump version to 0.45
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  8 Nov 2021 23:29:01 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - Changelog (since 0.44, from [1]):
> 
>   ver 0.45:
>     Fix issue with ICMPv6 and handling re-entrantly callbacks.
> 
> [1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/ell/ell.hash | 2 +-
>  package/ell/ell.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
