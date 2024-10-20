Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B2ED3C92A
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 12:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46B7940322;
	Sun, 20 Oct 2024 12:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebPdkSpmzVFS; Sun, 20 Oct 2024 12:07:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3886340324
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3886340324;
	Sun, 20 Oct 2024 12:07:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E09AAF2
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57EDF8059C
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FqOrL4JTFxpx for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 12:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14C1280589
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C1280589
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14C1280589
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:07:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E086E0005
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 12:07:27 +0000 (UTC)
Message-ID: <e104c431-7d11-4b9c-b69a-a6f7b1ef03a9@korsgaard.com>
Date: Sun, 20 Oct 2024 14:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Korsgaard <peter@korsgaard.com>
To: Buildroot Development <buildroot@buildroot.org>
References: <5a6a6ff8-6abf-4b01-9c8b-ca03a943e163@korsgaard.com>
Content-Language: en-US
In-Reply-To: <5a6a6ff8-6abf-4b01-9c8b-ca03a943e163@korsgaard.com>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Mailing list issues
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

On 10/17/24 22:43, Peter Korsgaard wrote:
> Hi,
> 
> FYI, we had some mailing list issues today caused by a migration of the 
> mailing list server, but if you get this then it should be working again ;)

I also saw 100+ unsubscribe notifications this morning, which may be 
related tot he mailing lists issues - Sorry about that.

Please resubscribe if you got accidentally unsubscribed.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
