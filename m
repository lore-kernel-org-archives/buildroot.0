Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F260C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 22:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E44DA40888;
	Mon,  3 Jan 2022 22:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dn8WrtB_XzF2; Mon,  3 Jan 2022 22:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7AD404CA;
	Mon,  3 Jan 2022 22:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C854A1BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4864404CA
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 22:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bW-5xPS-UVvn for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 22:20:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08ACE40258
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 22:20:55 +0000 (UTC)
Received: from [IPV6:2a01:e0a:280:24f0:e1ec:3569:4a62:3a5c] (unknown
 [IPv6:2a01:e0a:280:24f0:e1ec:3569:4a62:3a5c])
 (Authenticated sender: brissenden@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DD4A35FF93;
 Mon,  3 Jan 2022 23:20:49 +0100 (CET)
Message-ID: <16687956-3831-261a-cdf1-2b02ce463602@kaod.org>
Date: Mon, 3 Jan 2022 23:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220103165805.3697636-1-clg@kaod.org>
 <5da6fe27-bf22-7bd9-fcb5-c43551f1ed5c@gmail.com>
 <5aba2002-9e94-4683-b79d-5443f2852ffc@kaod.org>
 <d71851fe-f814-8e1f-104b-bdf5b802b083@gmail.com>
Content-Language: en-US
In-Reply-To: <d71851fe-f814-8e1f-104b-bdf5b802b083@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 6.2.0
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

Hello,
> Unlike all other defconfig, qemu defconfigs are runtime tested in gitlab.
> 
> Create a test branch named: qemu-6.2.0-defconfigs-qemu
> 
> Where: "qemu-6.2.0" is a prefix, "-defconfigs-" trigger a pipeline for testing
> Buildroot defconfis and "qemu" is a pattern.
> 
> See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/65d2f04c012af492a9b9da04dfa3b3cbd20347f1
> 
> "pushing a branch called "<foo>-defconfigs-<pattern>" which will test all
> defconfigs whose name start with the pattern."

That looks simple enough. Something is going wrong though :

   https://gitlab.com/legoater/buildroot/-/jobs/1937752353

Am I missing something ?

Thanks,

C.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
