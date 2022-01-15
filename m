Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F72CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 16:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCCD160AC5;
	Sat, 15 Jan 2022 16:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N3oZJoiVOB1c; Sat, 15 Jan 2022 16:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C77A60A8D;
	Sat, 15 Jan 2022 16:09:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 733071BF424
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E02460A8D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX5DGqwHaVF2 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 16:09:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51FE4607F9
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 16:09:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a19f:b904:d24b:da3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 31EC213F8AA;
 Sat, 15 Jan 2022 17:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642262980;
 bh=YKeZ0gk/66E+tUkE8qk/1d3JuKFAnzY8wjz1/22rncM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J0qWhJmtrwKl+ejf7EoBexjp4pSXGt2SG9iW0P2GrDXHom4KZhADnBpSGl6bQwevh
 7XRCJT3+wsFnJ077ZVCN2jHRx44SyeYbgra9MJEx24X0U4dPZwPQT2Sflv0W/SlaH4
 5BRXpVfzuGv19ni14Wf68HxYhtFHL6Qptojn2EObf+vzhr58TbLZpr3OjMJH8qmHF8
 wzvIQ7XnsSEvutKhJjJJce0j8883+C+Wda8F/oV1w/NINmy+v0F9WeeORzQx1iXWq9
 8gilcSryxfBMzuFbDbhphmheTJnRrQZhGUqnwp2YdQGdZkpiqKjOco2IWvtBCtdO/y
 /XP1YmNh1K7aQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jan 2022 17:09:37 +0100
Date: Sat, 15 Jan 2022 17:09:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexander Egorenkov <egorenar-dev@posteo.net>
Message-ID: <20220115160937.GR1945846@scaer>
References: <20220115101523.2932-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220115101523.2932-1-egorenar-dev@posteo.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to
 version 0.8.8
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alexander, All,

On 2022-01-15 10:15 +0000, Alexander Egorenkov spake thusly:
> Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/multipath-tools/multipath-tools.hash | 2 +-
>  package/multipath-tools/multipath-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
> index ac41e4815b72..f063848681ea 100644
> --- a/package/multipath-tools/multipath-tools.hash
> +++ b/package/multipath-tools/multipath-tools.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  7c5962be6068c78d5256e8fc979cf327988f7560705bb9cc25b508c50ca997c0  multipath-tools-0.8.7.tar.gz
> +sha256  ff45ddb18a1effbfbe5712f513dd3b7146c68141091fc1c2489af8d6197026ef  multipath-tools-0.8.8.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
>  sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
> diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
> index 3d8095b0b093..eecfe3900233 100644
> --- a/package/multipath-tools/multipath-tools.mk
> +++ b/package/multipath-tools/multipath-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MULTIPATH_TOOLS_VERSION = 0.8.7
> +MULTIPATH_TOOLS_VERSION = 0.8.8
>  MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
>  
>  MULTIPATH_TOOLS_LICENSE = \
> -- 
> 2.34.1
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
