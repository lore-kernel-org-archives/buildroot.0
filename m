Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6B8C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 09:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75CAA85077;
	Fri, 26 Jan 2024 09:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75CAA85077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PB6ApWbgXO0s; Fri, 26 Jan 2024 09:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7142850D1;
	Fri, 26 Jan 2024 09:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7142850D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0761BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D873E42C4C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D873E42C4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVoJc7LUpWxV for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 09:07:59 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 062F942C46
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062F942C46
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2AD924000F;
 Fri, 26 Jan 2024 09:07:56 +0000 (UTC)
Message-ID: <6dd2adc3-db47-46ee-8d21-2a1c36a5d209@korsgaard.com>
Date: Fri, 26 Jan 2024 10:07:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Hudson Ayers <hudson.ayers@getcruise.com>, buildroot@buildroot.org
References: <20240120005248.3986139-1-hudson.ayers@getcruise.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240120005248.3986139-1-hudson.ayers@getcruise.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/genimage: bump version to 17.0
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/01/2024 01.52, Hudson Ayers via buildroot wrote:
> This changes bumps the version of the genimage package,
> which brings in fixes when generating flash images that
> reference sparse files, along with other fixes and features.
> 
> Signed-off-by: Hudson Ayers <hudson.ayers@getcruise.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
