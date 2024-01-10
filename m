Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B571FC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A5482907;
	Wed, 10 Jan 2024 17:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69A5482907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLNIn2Cm0X5A; Wed, 10 Jan 2024 17:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E3481EA6;
	Wed, 10 Jan 2024 17:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6E3481EA6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECE011BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF03435F9
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCF03435F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4o0JkUCqKX-N for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:10:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A967403AF
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A967403AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 117E240003;
 Wed, 10 Jan 2024 17:10:54 +0000 (UTC)
Message-ID: <764c353d-f1d8-4e3b-a29f-d43fe10d4c6e@korsgaard.com>
Date: Wed, 10 Jan 2024 18:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231227202344.599971-1-peter@korsgaard.com>
 <ZY3XsVK9oklEwDwJ@landeda>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <ZY3XsVK9oklEwDwJ@landeda>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1: bump to version
 1.22.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/12/2023 21.16, Yann E. MORIN wrote:
> Peter, All,
> 
> On 2023-12-27 21:23 +0100, Peter Korsgaard spake thusly:
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> Series of 12 patches applied to master, thanks.

Series committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
