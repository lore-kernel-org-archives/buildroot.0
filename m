Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6206FC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Oct 2022 15:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6A841C73;
	Fri,  7 Oct 2022 15:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD6A841C73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9LVEGT5IqfO; Fri,  7 Oct 2022 15:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DACEA41C6B;
	Fri,  7 Oct 2022 15:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DACEA41C6B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7B1F1BF2CF
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 840D24057F
 for <buildroot@lists.busybox.net>; Fri,  7 Oct 2022 15:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 840D24057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OefKv3h_x-1j for <buildroot@lists.busybox.net>;
 Fri,  7 Oct 2022 15:04:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EEF84017A
Received: from mailproxy04.manitu.net (mailproxy04.manitu.net [217.11.48.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EEF84017A
 for <buildroot@buildroot.org>; Fri,  7 Oct 2022 15:04:26 +0000 (UTC)
Received: from [IPV6:2001:a61:2571:e101:cb62:e29b:df1e:fe65] (unknown
 [IPv6:2001:a61:2571:e101:cb62:e29b:df1e:fe65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy04.manitu.net (Postfix) with ESMTPSA id C96138049F;
 Fri,  7 Oct 2022 17:04:19 +0200 (CEST)
Message-ID: <b28a67fd-d7c0-1059-6905-82952ea45dfc@grandegger.com>
Date: Fri, 7 Oct 2022 17:04:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <41db705a-2c63-47bc-3f03-d4c52d2a4b14@grandegger.com>
 <e6ddbdfb-7f8b-4eb2-e25d-24fe0c82e981@benettiengineering.com>
 <1d22bd7b-1136-6911-7181-81f2b24c5b00@grandegger.com>
 <7dce1c6a-176b-d97a-47b3-cc74a16ad2a6@benettiengineering.com>
From: Wolfgang Grandegger <wg@grandegger.com>
In-Reply-To: <7dce1c6a-176b-d97a-47b3-cc74a16ad2a6@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/udisks: install to staging
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Done!

Thx,

Wolfgang

On 07.10.22 14:05, Giulio Benetti wrote:
> Hi Wolfgang,
> 
> On 07/10/22 09:35, Wolfgang Grandegger wrote:
>> Hello Giulio,
>>
>> I send trivial patches directly via email. Without "git send-email..." 
>> and I also didn't use "buildroot/get-developers". I just sent v2, hope 
>> it's fine now!?
> 
> Yes, now it looks ok. I ask you please to register to patchwork and set
> v1 patch to superseded:
> https://patchwork.ozlabs.org/project/buildroot/list/
> 
> Thank you!
> Best regards
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
