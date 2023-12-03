Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288CAC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 19:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9906A40488;
	Sun,  3 Dec 2023 19:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9906A40488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ij35NzYEq92T; Sun,  3 Dec 2023 19:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B00BB40438;
	Sun,  3 Dec 2023 19:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B00BB40438
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7726D1BF32C
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 19:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C6D081463
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 19:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C6D081463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJpIFOMCBdg6 for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 19:20:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA76F81461
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 19:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA76F81461
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18DD460002;
 Sun,  3 Dec 2023 19:19:57 +0000 (UTC)
Message-ID: <8da56124-7e33-461a-94d3-a2df72968503@korsgaard.com>
Date: Sun, 3 Dec 2023 20:19:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20231121180339.3015360-1-ju.o@free.fr>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231121180339.3015360-1-ju.o@free.fr>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH next 1/1] package/rdma-core: bump to version
 v49.0
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

On 21/11/2023 19.03, Julien Olivain wrote:
> For change log, see:
> https://github.com/linux-rdma/rdma-core/releases/tag/v49.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
