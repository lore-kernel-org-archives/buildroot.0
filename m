Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D80C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 08:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FF6760DCA;
	Fri, 13 May 2022 08:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11d-x-54LF_z; Fri, 13 May 2022 08:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6980160D54;
	Fri, 13 May 2022 08:22:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67C421BF332
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 08:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56FA7833C6
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 08:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW6wS8-VSHic for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 08:22:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2644B83342
 for <buildroot@buildroot.org>; Fri, 13 May 2022 08:22:16 +0000 (UTC)
Received: from lmontsouris-655-1-15-199.w80-11.abo.wanadoo.fr
 ([80.11.122.199]:54262 helo=[192.168.1.105])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1npQYw-0003AX-Nx; Fri, 13 May 2022 10:22:14 +0200
Message-ID: <94a51d3d-6bf8-6be5-6f07-6197e52202c0@lucaceresoli.net>
Date: Fri, 13 May 2022 10:22:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
 <20220512185355.873825-17-bernd.kuhls@t-online.de>
 <20220512194821.GB1597494@scaer>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220512194821.GB1597494@scaer>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 17/25] package/x11r7/xapp_xsm: bump version
 to 1.0.5
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

Hi Yann,

On 12/05/22 21:48, Yann E. MORIN wrote:
> Bernd, All,
> 
> +Arnout +Peter +Luca
> 
> On 2022-05-12 20:53 +0200, Bernd Kuhls spake thusly:
>> Release notes:
>> https://lists.x.org/archives/xorg-announce/2022-April/003152.html
>>
>> Updated license hash due to upstream commit:
>> https://gitlab.freedesktop.org/xorg/app/xsm/-/commit/e552f2d4980d41d7a219dbe0c5dbaf33c4d752f3
> 
> I was a bit surprised that the new licensing terms are not really those
> of the MIT license, so I checked, and that's what SPDX knows as the MIT
> license:
>     https://spdx.org/licenses/MIT.html
> 
> However, the license for the xsm is not exactly those terms, but is
> known by SPDX as MIT-open-group (MIT Open Group variant):
>     https://spdx.org/licenses/MIT-open-group.html

You're absolutely right.

> So, I am not sure. I would tend to think we should switch listing them
> as MIT-open-group.

And report them the issue, and [as them to] fix Wikipedia.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
