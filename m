Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58627C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 12:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6FA681BE3;
	Wed, 27 Jul 2022 12:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FA681BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zCVWF2HNee3K; Wed, 27 Jul 2022 12:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C3982435;
	Wed, 27 Jul 2022 12:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C3982435
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3409C1BF372
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FA4340518
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 12:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FA4340518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 54BW2hYTzR3y for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 12:32:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4573E40516
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4573E40516
 for <buildroot@uclibc.org>; Wed, 27 Jul 2022 12:32:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oGgCu-0008vZ-7t
 for buildroot@uclibc.org; Wed, 27 Jul 2022 14:32:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 27 Jul 2022 14:31:21 +0200
Message-ID: <pan$afa5f$3cdb44e3$619967c9$b6a8601@ID-313208.user.individual.net>
References: <20220213130306.3002130-1-bernd.kuhls@t-online.de>
 <20220727115113.0d06fb96__9944.83321426145$1658915496$gmane$org@windsurf>
 <pan$74f48$42282b93$fd100b6e$bd156916@ID-313208.user.individual.net>
 <c3833aee-090a-8247-5d6f-98781ae9e887@mind.be>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/e3: new package
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

Am Wed, 27 Jul 2022 12:24:19 +0200 schrieb Arnout Vandecappelle:

> On 27/07/2022 12:16, Bernd Kuhls wrote:
>> Am Wed, 27 Jul 2022 11:51:13 +0200 schrieb Thomas Petazzoni via
>> buildroot:
>> 
>>> This doesn't seem like a very useful addition to Buildroot to be
>>> honest.
>>> Do you have some convincing arguments? :-)
> 
>   The main concern really is that it requires lots of patches, some of
>   which are
> very old. This suggests that it will have serious maintenance overhead.

ok, I marked the patch as rejected.

>   You're still going to need busybox to have a working system, and
>   busybox vi
> implementation adds way less than 16K to the size. So this argument
> doesn't really fly.

This depends on how familiar you are with the vi syntax ;)

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
