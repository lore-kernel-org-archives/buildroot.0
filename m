Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5D7D2E9D1
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 10:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A1FA605BA;
	Mon, 11 Nov 2024 10:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EybNE5eQpD32; Mon, 11 Nov 2024 10:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59D3F60635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59D3F60635;
	Mon, 11 Nov 2024 10:11:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D26FE6C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C780460635
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XncxyovISGF8 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 10:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C79C2605BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79C2605BA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C79C2605BA
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:11:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 248151C0003
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 10:11:46 +0000 (UTC)
Message-ID: <e40855f0-9010-4829-a2ff-31ab5273dae8@korsgaard.com>
Date: Mon, 11 Nov 2024 11:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <DU0P251MB0801A93E7F9B025DA4AF40CEFA762@DU0P251MB0801.EURP251.PROD.OUTLOOK.COM>
 <d91c44ed7beb7026f445ff10fa5af5f2@free.fr>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <d91c44ed7beb7026f445ff10fa5af5f2@free.fr>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] package/jailhouse: small typo error when installing
 helper scripts
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

On 10/26/24 11:59, Julien Olivain wrote:
> Hi Raimundo,
> 
> Thanks for the patch!
> 
> The mail and patch was not correctly formatted and could not be
> applied as is. Fortunately, the patch was simple enough so I could
> reformat it myself.
> 
> So I applied it to master.
> 
> For your future contributions, please have a look to the Buildroot
> manual:
> https://buildroot.org/downloads/manual/manual.html#submitting-patches

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
