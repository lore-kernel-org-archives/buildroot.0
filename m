Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF0EC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAD5C4149F;
	Sun,  3 Dec 2023 18:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD5C4149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iw2igagTtl1S; Sun,  3 Dec 2023 18:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3210941496;
	Sun,  3 Dec 2023 18:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3210941496
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D67F1BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 065DF41496
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 065DF41496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEIxNmUC1JMI for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:09:14 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8D1B4148F
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D1B4148F
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB550E0006;
 Sun,  3 Dec 2023 18:09:10 +0000 (UTC)
Message-ID: <d015344c-2fab-4eea-a9c4-b4b0362e2094@korsgaard.com>
Date: Sun, 3 Dec 2023 19:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20231120135443.45265-1-flaniel@linux.microsoft.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231120135443.45265-1-flaniel@linux.microsoft.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/tbb: bump to version 2021.11.0.
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

On 20/11/2023 14.54, Francis Laniel wrote:
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Committed to next, thanks.

> ---
>   package/tbb/tbb.hash | 2 +-
>   package/tbb/tbb.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> index 085d54109a..4d2cb10da8 100644
> --- a/package/tbb/tbb.hash
> +++ b/package/tbb/tbb.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b  tbb-2021.10.0.tar.gz
> +sha256  782ce0cab62df9ea125cdea253a50534862b563f1d85d4cda7ad4e77550ac363  tbb-2021.11.0.tar.gz
>   sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
> diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> index 75cca5e99d..1b0afbb889 100644
> --- a/package/tbb/tbb.mk
> +++ b/package/tbb/tbb.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TBB_VERSION = 2021.10.0
> +TBB_VERSION = 2021.11.0
>   TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
>   TBB_INSTALL_STAGING = YES
>   TBB_LICENSE = Apache-2.0

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
