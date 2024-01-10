Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEB7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B21F613EF;
	Wed, 10 Jan 2024 10:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B21F613EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_o3sHU_CScw; Wed, 10 Jan 2024 10:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6312613EC;
	Wed, 10 Jan 2024 10:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6312613EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6AAE1BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD29F41C0F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD29F41C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lS6XrBU5N_15 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:20:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97133402B2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97133402B2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0380DE000A
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:20:04 +0000 (UTC)
Message-ID: <d0b33409-219b-4f1d-b485-8d05d17379bc@korsgaard.com>
Date: Wed, 10 Jan 2024 11:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231223195510.18755-1-thomas.petazzoni@bootlin.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231223195510.18755-1-thomas.petazzoni@bootlin.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/x11r7/xwayland: security bump to
 23.2.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 23/12/2023 20.55, Thomas Petazzoni via buildroot wrote:
> According to
> https://lists.x.org/archives/xorg-announce/2023-December/003437.html:
> 
>    This release contains the fixes for CVE-2023-6377 and CVE-2023-6478
>    in today's security advisory:
>    https://lists.x.org/archives/xorg-announce/2023-December/003435.html
> 
> The release has only 10 commits compared to 23.2.2, all of which being
> fixes, two of them being the security fixes. So it seems like bumping
> the version is a reasonable trade-off vs. backporting the security
> fixes.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
