Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D901FC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 08:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D20A84677;
	Wed, 13 Jul 2022 08:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D20A84677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vB7UVsTr0tHY; Wed, 13 Jul 2022 08:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FB9D84672;
	Wed, 13 Jul 2022 08:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FB9D84672
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 47D431BF392
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 08:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30578614F2
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 08:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30578614F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wbmpxy-oVSji for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 08:55:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4781B614F1
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4781B614F1
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 08:55:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89567200010;
 Wed, 13 Jul 2022 08:55:22 +0000 (UTC)
Message-ID: <b0281498-b659-9ef9-655b-8866ce0051d5@korsgaard.com>
Date: Wed, 13 Jul 2022 10:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>, buildroot@buildroot.org
References: <YqN7MemqvW0pXxC3@hs>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <YqN7MemqvW0pXxC3@hs>
Subject: Re: [Buildroot] [PATCH 1/1] package/tinyproxy: bump to version
 1.11.1
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

On 10/06/2022 19.11, Alexander Mukhin wrote:
> 
> https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>


Committed to 2022.02.x and 2022.05.x given the fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
