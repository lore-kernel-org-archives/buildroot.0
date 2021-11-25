Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 18:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B265440278;
	Thu, 25 Nov 2021 18:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9W3eAOwZeTeM; Thu, 25 Nov 2021 18:18:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EEC4026E;
	Thu, 25 Nov 2021 18:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D3651BF94B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 18:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA8E4026C
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 18:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPtIYz3opxGs for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 18:18:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 987AC4025B
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 18:18:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 970321FB;
 Thu, 25 Nov 2021 10:18:15 -0800 (PST)
Received: from debian (C02TH0X6HF1T.nice.arm.com [10.34.124.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 123543F73B;
 Thu, 25 Nov 2021 10:18:14 -0800 (PST)
Date: Thu, 25 Nov 2021 19:18:12 +0100
From: Vincent =?utf-8?Q?Stehl=C3=A9?= <vincent.stehle@arm.com>
To: "D. Olsson" <hi@senzilla.io>
Message-ID: <YZ/TZBymngTK8U7R@debian>
Mail-Followup-To: "D. Olsson" <hi@senzilla.io>, buildroot@buildroot.org,
 Erico Nunes <nunes.erico@gmail.com>
References: <20211125102441.5351-1-vincent.stehle@arm.com>
 <97980B85-6CCC-45FB-8ED2-CDD2430ECFBD@senzilla.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97980B85-6CCC-45FB-8ED2-CDD2430ECFBD@senzilla.io>
Subject: Re: [Buildroot] [PATCH next] configs/aarch64_efi: bump kernel
 version
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

On Thu, Nov 25, 2021 at 01:28:16PM +0100, D. Olsson wrote:
..
> I understand that you might have tested this with U-Boot firmware. But the updated instructions doesn't make any references to U-Boot, so your description is a little bit confusing. Maybe simplify the commit message?

Hi Dick,

Thanks for your review; I will simplify the commit message.

Best regards,
Vincent.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
