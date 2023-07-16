Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79766EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06974405D0;
	Sun, 16 Jul 2023 16:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06974405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IlN_q44SNK3M; Sun, 16 Jul 2023 16:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5761940492;
	Sun, 16 Jul 2023 16:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5761940492
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C5581BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A836068B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32A836068B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKDxnchGtaPt for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:27:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD2D605F6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBD2D605F6
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:27:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F06660003;
 Sun, 16 Jul 2023 16:27:15 +0000 (UTC)
Message-ID: <ad318813-577d-5c94-795a-6573f848d39c@korsgaard.com>
Date: Sun, 16 Jul 2023 18:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
References: <20230627143401.594223-1-bisson.gary@gmail.com>
 <20230627143401.594223-3-bisson.gary@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230627143401.594223-3-bisson.gary@gmail.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] configs/nitrogen*: add missing pylibfdt
 u-boot dependency
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

On 27/06/2023 16.34, Gary Bisson wrote:
> Needed by binman.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271714
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271716
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271718
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271719
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
