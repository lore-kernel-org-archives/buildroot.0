Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD61FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A896683051;
	Wed,  1 Jun 2022 21:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buKkeYyLM5zS; Wed,  1 Jun 2022 21:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 626FB83385;
	Wed,  1 Jun 2022 21:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8B771BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6FCC83051
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ex_z3arYWSw1 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:18:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19AA28145B
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:18:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2BEBD100003;
 Wed,  1 Jun 2022 21:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654118332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWqRl9dtFwOlwJUSjx+iTHJu8slQMNhN5wSyQacpCFA=;
 b=Uyfsw2ahOVyycLXmExc2W2vm5YkJYR46rZlAW311/p8T7w/1xGtxYrNCEAL0isQFISAUtG
 G8QTdhV+4Xdu/Y2tcx3bL9w3MFIoD+2qgP9OqGeVSxO9cCHSHngAU4pkY9spfOqa8KVhdY
 IyBVNzy4EsVeX4HOzLbkSdPjMgqfWQr1hb3VQJdETXjru35abUc4VMHWy7SI84IFd3gfrD
 71xe0T/RskZ0qOHIYGms9FGHog32wdLH/j5za/XEEcxjrd+JGOJpHaWD+3rxnWhiwIBGx1
 gnk6I20S9jG1p7xDnuwpp1zQAfGiofocBGSf0Cmd83RShmzU5h5v0M7fD4BpOg==
Date: Wed, 1 Jun 2022 23:18:51 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220601231851.47751592@windsurf>
In-Reply-To: <20220531155216.20802-1-bernd.kuhls@t-online.de>
References: <20220531155216.20802-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH/next 1/3] package/kodi-peripheral-joystick:
 bump version to 19.0.3-Matrix
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 May 2022 17:52:14 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

All 3 patches applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
