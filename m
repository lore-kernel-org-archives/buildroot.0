Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EAAEB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C977F40463;
	Sun, 16 Jul 2023 16:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C977F40463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vAJGXkA0NKR; Sun, 16 Jul 2023 16:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1706E400FF;
	Sun, 16 Jul 2023 16:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1706E400FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87FB91BF2F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60942408CE
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60942408CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9nVzgADSX5aJ for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:27:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B77F408B3
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B77F408B3
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:26:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D97DC0002;
 Sun, 16 Jul 2023 16:26:58 +0000 (UTC)
Message-ID: <09237291-19f6-abe4-4083-9a6eb5271caa@korsgaard.com>
Date: Sun, 16 Jul 2023 18:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
References: <20230627143401.594223-1-bisson.gary@gmail.com>
 <20230627143401.594223-2-bisson.gary@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230627143401.594223-2-bisson.gary@gmail.com>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/nitrogen*: add missing openssl
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
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271709
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271710
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4519271712
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
