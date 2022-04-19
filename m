Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18950C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 18:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B20394056C;
	Tue, 19 Apr 2022 18:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pievbo9fR03Y; Tue, 19 Apr 2022 18:50:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6FB940502;
	Tue, 19 Apr 2022 18:50:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 389001BF873
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 18:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 260C8415CB
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 18:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EeNlgmGnIklC for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 18:50:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DA5741560
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 18:50:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (5)
Received: from [192.168.10.50] (dynamic-78-10-107-45.ssp.dialog.net.pl
 [78.10.107.45])
 by server220076.nazwa.pl (Postfix) with ESMTP id 353871BD066;
 Tue, 19 Apr 2022 20:50:39 +0200 (CEST)
Message-ID: <bf6ac8b1-56b7-5d89-e7fe-3fd4344e1e0f@grinn-global.com>
Date: Tue, 19 Apr 2022 20:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220419044315.DADA71BBEDC@server220076.nazwa.pl>
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <20220419044315.DADA71BBEDC@server220076.nazwa.pl>
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-04-18
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 19.04.2022 06:43, Thomas Petazzoni wrote:
> Hello,
>
> Autobuilder failures
> ====================
>
> Below is a list of build failures reported by the Buildroot autobuilders
> in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those
> build failures and sending patches to fix them.
>
> Results for the 'master' branch
> -------------------------------
>
> Build failures related to your packages:
>
>      arch     |             reason             |                                       url
> -------------+--------------------------------+---------------------------------------------------------------------------------
>      arm      |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/0f7952eee8e3dcdd3f5df1b18ce561cca78ba7e0
>      arm      |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/0b6a917b9572574ce8585a7978db86729a8ef8d3
>      arc      |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/e1636589992b8896477ed2229bc7ccfc18847e9a
>      sh4      |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/f28872352d28b1ce67a3c81d524feb0138fe0284
>      i686     |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/e488a1035c2de3a5d58127c0363390dcb9a0c68f
>      m68k     |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/66045099ba830c1527a75c0308bd55d4655df20d
>    mips64el   |           ttyd-1.6.3           | http://autobuild.buildroot.net/results/d198d6285847d570329c2d2e1ea86a2f423b2829

https://patchwork.ozlabs.org/project/buildroot/patch/20220419184756.255846-1-b.bilas@grinn-global.com/

Best
Bartek
>
>
> Thanks for your contribution to Buildroot!
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
