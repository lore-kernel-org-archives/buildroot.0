Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774BEC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357414179D;
	Mon,  5 Feb 2024 10:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 357414179D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOjThaAUl5FB; Mon,  5 Feb 2024 10:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E1541798;
	Mon,  5 Feb 2024 10:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88E1541798
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4749B1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CDE582661
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDE582661
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndhizQGJcqan for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:26:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6699482656
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6699482656
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEB741C0007;
 Mon,  5 Feb 2024 10:26:36 +0000 (UTC)
Message-ID: <cb79d5a3-7a75-47ee-ba34-45e6739ea616@korsgaard.com>
Date: Mon, 5 Feb 2024 11:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dimi Tomov <dimi@tpm.dev>, buildroot@buildroot.org
References: <20240119165659.155158-1-dimi@tpm.dev>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240119165659.155158-1-dimi@tpm.dev>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolftpm: bump version to v3.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/01/2024 17.56, Dimi Tomov wrote:
> From: Dimitar Tomov <dimi@tpm.dev>
> 
> Signed-off-by: Dimitar Tomov <dimi@tpm.dev>
> ---
>   package/wolftpm/wolftpm.hash | 2 +-
>   package/wolftpm/wolftpm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
> index 3329528095..33d0aa2414 100644
> --- a/package/wolftpm/wolftpm.hash
> +++ b/package/wolftpm/wolftpm.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  d8e06e77893f104be7eb9421cac50518552ad9c5fc7fe8a9c1cdfaf4f11b92df  wolftpm-2.7.0.tar.gz
> +sha256  b4f6c090cad7fdbd4fd976f1bd8f271694669459b240fa14bec60a89b749dc1b  wolftpm-3.1.0.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
> index db332712f5..4d1d459801 100644
> --- a/package/wolftpm/wolftpm.mk
> +++ b/package/wolftpm/wolftpm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WOLFTPM_VERSION = 2.7.0
> +WOLFTPM_VERSION = 3.1.0
>   WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
>   WOLFTPM_INSTALL_STAGING = YES
>   WOLFTPM_LICENSE = GPL-2.0+

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
