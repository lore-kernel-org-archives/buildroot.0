Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3117C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41BE140AEE;
	Mon,  5 Feb 2024 11:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41BE140AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dcp0LgUy6tmR; Mon,  5 Feb 2024 11:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6509240BFD;
	Mon,  5 Feb 2024 11:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6509240BFD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A2341BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 129D281E5E
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 129D281E5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Vuna52Ms8JH for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:03:48 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17FB2812A0
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17FB2812A0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B6171C000D;
 Mon,  5 Feb 2024 11:03:46 +0000 (UTC)
Message-ID: <5614e73d-4356-4e36-ba10-2ad7d3cef8fb@korsgaard.com>
Date: Mon, 5 Feb 2024 12:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Woodrow Douglass <wdouglass@carnegierobotics.com>, buildroot@buildroot.org
References: <20240117212634.1334907-1-wdouglass@carnegierobotics.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20240117212634.1334907-1-wdouglass@carnegierobotics.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/uboot-tools: install
 fit_check_sign if available
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

On 17/01/2024 22.26, Woodrow Douglass via buildroot wrote:
> fit_check_sign is a tool for verifying fit image signatures.
> it gets built by host-uboot-tools, but not installed in the path.
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Committed after rewording the commit message a bit, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
