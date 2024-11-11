Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3F3D12D61
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 15:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9CC60585;
	Mon, 11 Nov 2024 15:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITTVS-eJxDj8; Mon, 11 Nov 2024 15:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61051606CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61051606CA;
	Mon, 11 Nov 2024 15:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23FE1D8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1178B4041C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KK4JPN4cH1ab for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 15:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 275D6400AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 275D6400AB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 275D6400AB
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:50:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 274E81BF203
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 15:50:12 +0000 (UTC)
Message-ID: <28515a86-7d53-4626-b3b6-f7ec28cb7a68@korsgaard.com>
Date: Mon, 11 Nov 2024 16:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <34dfbb5898332cf5e1c9788938a85004a9b771a9.1726557959.git.yann.morin@orange.com>
 <20241026174002.1e94bd5e@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241026174002.1e94bd5e@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump version
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

On 10/26/24 17:40, Thomas Petazzoni via buildroot wrote:
> On Tue, 17 Sep 2024 09:25:59 +0200
> <yann.morin@orange.com> wrote:
> 
>> From: "Yann E. MORIN" <yann.morin@orange.com>
>>
>> Update of the vendored dependencies.
>>
>> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
>> ---
>>   package/skopeo/skopeo.hash | 2 +-
>>   package/skopeo/skopeo.mk   | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Applied to master, thanks.

NIT: The summary should have been "package/skopeo: bump to version 1.16.1

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
