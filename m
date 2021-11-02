Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4F3C433FE
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 19:43:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B00360F58
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 19:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B00360F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9B4C80E30;
	Tue,  2 Nov 2021 19:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iSdKqS_UODvO; Tue,  2 Nov 2021 19:43:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A2F180E27;
	Tue,  2 Nov 2021 19:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A5BC1BF2F9
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131CF40359
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 19:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXUhvpsqhw2Q for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 19:43:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF67D40240
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 19:43:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3349CE0008;
 Tue,  2 Nov 2021 19:43:06 +0000 (UTC)
Date: Tue, 2 Nov 2021 20:43:04 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211102204304.1e6b0c09@windsurf>
In-Reply-To: <20211102003713.2441861-1-giulio.benetti@benettiengineering.com>
References: <20211102003713.2441861-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to all
 Olimex Allwinner boards' defconfigs
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

On Tue,  2 Nov 2021 01:37:13 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Add Giulio Benetti to all Olimex Allwinner boards' defconfigs since I've
> recently updated and tested them all and I'd like to receive possible
> build failure related to this topic from gitlab CI/CD.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 65240615b0..a2f29881ec 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1052,6 +1052,7 @@ F:	package/xapian/
>  N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>  F:	configs/amarula_vyasa_rk3288_defconfig
>  F:	configs/asus_tinker_rk3288_defconfig
> +F:	configs/olimex_a*

Thanks for volunteering to help maintain those boards! You should also
add yourself for the corresponding files in board/.

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
