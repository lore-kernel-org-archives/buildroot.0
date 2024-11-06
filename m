Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4811FD59F73
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11B3880CDF;
	Wed,  6 Nov 2024 21:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aD3MO8CUZ-zV; Wed,  6 Nov 2024 21:06:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3417D811E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3417D811E3;
	Wed,  6 Nov 2024 21:06:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0128E4C38
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E24FF60652
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fd8t1e1rIwCx for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:06:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3AC560606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3AC560606
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3AC560606
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:06:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 33D1340006
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:06:45 +0000 (UTC)
Message-ID: <2756d951-aada-4d76-b61c-4c34c88efab5@korsgaard.com>
Date: Wed, 6 Nov 2024 22:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20241022211635.36d035fe@windsurf>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241022211635.36d035fe@windsurf>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] Welcome to Julien Olivain as Buildroot maintainer
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

On 10/22/24 21:16, Thomas Petazzoni via buildroot wrote:
> Hello all,
> 
> We're happy to announce that we've just added Julien Olivain as a
> new member of the Buildroot maintainer's team. This has been in
> discussion way before Yann decided to retire from the maintainer's
> team, so it is unrelated to Yann's decision, but obviously will be
> useful to help handle the amount of contributions we receive.
> 
> Julien has been making for a few years very positive contributions to
> Buildroot, and we believe he will help the project in a similarly
> positive way as a maintainer.
> 
> Once again, welcome Julien!

Yes, welcome Julien!

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
