Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45895D5E373
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CBC04018F;
	Sat,  9 Nov 2024 16:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf60PL34e0VH; Sat,  9 Nov 2024 16:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5121401CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5121401CD;
	Sat,  9 Nov 2024 16:46:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B68D3D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97A0080C96
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7b3-yMiwZ8vj for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 16:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCBE6809E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCBE6809E8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCBE6809E8
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:46:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 555AF240002
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 16:46:42 +0000 (UTC)
Message-ID: <15d2ad3f-190a-48b4-b7d8-ae6cff6b9798@korsgaard.com>
Date: Sat, 9 Nov 2024 17:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241023202814.447269-1-anisse@astier.eu>
 <20241023231337.1b0997be@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241023231337.1b0997be@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: drop Anisse Astier
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

On 10/23/24 23:13, Thomas Petazzoni via buildroot wrote:
> On Wed, 23 Oct 2024 22:28:14 +0200
> Anisse Astier <anisse@astier.eu> wrote:
> 
>> I am no longer actively involved in Buildroot.
>>
>> Signed-off-by: Anisse Astier <anisse@astier.eu>
>> ---
>>   DEVELOPERS | 5 -----
>>   1 file changed, 5 deletions(-)
> 
> Applied to master, thanks a lot for your contributions to Buildroot
> over the years!

Yes, thank you. Committed to 2024.02.x and 2024.08.x.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
