Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B43C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C27B040590;
	Sat, 22 Jan 2022 19:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fFIOOZMWmw2; Sat, 22 Jan 2022 19:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9662140145;
	Sat, 22 Jan 2022 19:58:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D65301BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C415D40145
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Abd9-NdDjDf7 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:58:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2AAB40017
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:58:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 03BBBB0053E;
 Sat, 22 Jan 2022 20:58:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642881524;
 bh=dR/8q6Uowlgs5fKJrT9HeyhLG+IicSBTOKT9v+51Kpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Psh8z/ZDurnBeYfN75i5YxVD3Q/92caqgyBEvRvgk3uTXWljBX1ab8kEvpBSH32Z1
 8asaz597N/DD+O77i1yXAWRTlJ4RET1QkkHrI0F6qhZtAUTnyt1BHBx1geZdUzQw4f
 yPdoEsFHjDzyEsnGZ6wSXjCq1kflOth1wIbKC9vPSYQKRfiHI7icXpeaJuzoNmjJDu
 +zV34LyvN4IJFNyqfaZIkc/GAeE7DpTWToNMswXtw2si89+/BB9lj4xVu/oGCfb5Gc
 uCDY0Hp0atbm24T979ArYRAMv8BbqgBxU39VDyrGHxYCivwDfOBJ8D3wkXRmmhpb23
 fBWBuAtAItGag==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 20:58:40 +0100
Date: Sat, 22 Jan 2022 20:58:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220122195840.GE3621364@scaer>
References: <20220122153207.1376790-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122153207.1376790-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-mediadriver: bump version
 to 22.1.1
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-01-22 16:32 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-mediadriver/intel-mediadriver.hash | 2 +-
>  package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
> index 38121da036..ceafa20e80 100644
> --- a/package/intel-mediadriver/intel-mediadriver.hash
> +++ b/package/intel-mediadriver/intel-mediadriver.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  6c1cd5c4c1b7bd1c7785ed4d553b76b17dd7e673619a39e0c3070246aa671024  intel-media-22.1.0.tar.gz
> +sha256  6eaa4a9caf58faa8934b253adb4b0ece1c7d5de6f084167d5138b4e3ba423683  intel-media-22.1.1.tar.gz
>  sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
> diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
> index 99348537bf..d8820379e7 100644
> --- a/package/intel-mediadriver/intel-mediadriver.mk
> +++ b/package/intel-mediadriver/intel-mediadriver.mk
> @@ -6,7 +6,7 @@
>  
>  # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
>  
> -INTEL_MEDIADRIVER_VERSION = 22.1.0
> +INTEL_MEDIADRIVER_VERSION = 22.1.1
>  INTEL_MEDIADRIVER_SITE = http://github.com/intel/media-driver/archive
>  INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
>  INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
